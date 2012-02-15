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
#   If you specify a different staging location, please manage the file resource as necessary.
#
define staging::file (
  $source,
  $target      = undef,
  $username    = undef,
  $certificate = undef,
  $password    = undef,
  $environment = undef
) {

  include staging

  if $target {
    $target_file = $target
    $staging_dir = staging_parse($target, 'parent')
  } else {
    $staging_dir = "${staging::path}/${caller_module_name}"
    $target_file = "${staging_dir}/${name}"

    if ! defined(File[$staging_dir]) {
      file { $staging_dir:
        ensure=>directory,
      }
    }
  }

  Exec {
    path        => '/usr/local/bin:/usr/bin:/bin',
    environment => $environment,
    cwd         => $staging_dir,
    creates     => $target_file,
  }

  case $source {
    /^\//: {
      file { $target_file:
        source  => $source,
        replace => false,
      }
    }

    /^puppet:\/\//: {
      file { $target_file:
        source  => $source,
        replace => false,
      }
    }

    /^http:\/\//: {
      exec { $target_file:
        command     => "curl -L -o ${name} ${source}",
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

      exec { $target_file:
        command     => $command,
      }
    }

    /^ftp:\/\//: {
      if $username {
        $command = "curl -o ${name} -u ${username}:${password} ${source}"
      } else {
        $command = "curl -o ${name} ${source}"
      }

      exec { $target_file:
        command     => $command,
      }
    }

    default: {
      fail("stage::file: do not recognize source ${source}.")
    }
  }

}
