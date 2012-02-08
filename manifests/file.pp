# Define: staging::file
#
#   Define resource to retrieve files to staging directories. It is
#   intententionally not replacing files, as these intend to be large binaries
#   that are versioned.
#
# Parameters:
#
#   * source: the source file location, supports local files, puppet://, http://, https://, ftp://
#   * target: the target staging directory, if unspecified ${staging::path}/${caller_module_name}.
#   * username: https or ftp username.
#   * certificate: https certificate file.
#   * password: https or ftp user password or https certificate password.
#   * environment: environment variable for settings such as http_proxy, https_proxy, of ftp_proxy.
#
# Usage:
#
#   staging::file { 'apache-tomcat-6.0.35':
#     source => 'http://apache.cs.utah.edu/tomcat/tomcat-6/v6.0.35/bin/apache-tomcat-6.0.35.tar.gz',
#   }
#
define staging::file (
  $source,
  $target      = undef,
  $username    = undef,
  $certificate = undef,
  $password    = undef,
  $environment = undef,
) {

  include staging

  if $target {
    $file_path = "${target}/${name}"
  } else {
    $staging_path = "${staging::path}/${caller_module_name}"
    $file_path    = "${staging_path}/${name}"

    if ! defined(File[$staging_path]) {
      file { $staging_path:
        ensure=>directory,
      }
    }
  }

  case $source {
    /^\//: {
      file { $file_path:
        source  => $source,
        replace => false,
      }
    }

    /^puppet:\/\//: {
      file { $file_path:
        source  => $source,
        replace => false,
      }
    }

    /^http:\/\//: {
      exec { $file_path:
        command     => "curl -L -o ${name} ${source}",
        path        => '/usr/local/bin:/usr/bin:/bin',
        environment => $environment,
        cwd         => $staging_path,
        creates     => "$file_path"
      }
    }

    /^https:\/\//: {
      if $username {
        $command = "curl -L -o ${name} -u ${username}:${password} ${source}"
      } elsif $certificate {
        $command = "curl -L -o ${name} -E ${certificate}:${password} ${source}"
      } else {
        $command = "curl -L -o ${name} ${source}"
      }

      exec { $file_path:
        command     => $command,
        path        => '/usr/local/bin:/usr/bin:/bin',
        environment => $environment,
        cwd         => $staging_path,
        creates     => "$file_path"
      }
    }

    /^ftp:\/\//: {
      if $username {
        $command = "curl -o ${name} -u ${username}:${password} ${source}"
      } else {
        $command = "curl -o ${name} ${source}"
      }

      exec { $file_path:
        command     => $command,
        path        => '/usr/local/bin:/usr/bin:/bin',
        environment => $environment,
        cwd         => $staging_path,
        creates     => "$file_path"
      }
    }

    default: {
      fail("stage::file: do not recognize source ${source}.")
    }
  }

}
