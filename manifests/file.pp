# #### Overview:
#
# Define resource to retrieve files to staging directories. It is
# intententionally not replacing files, as these intend to be large binaries
# that are versioned.
#
# #### Notes:
#
#   If you specify a different staging location, please manage the file
#   resource as necessary.
#
define staging::file (
  $source,              #: the source file location, supports local files, puppet://, http://, https://, ftp://
  $target      = undef, #: the target staging directory, if unspecified ${staging::path}/${caller_module_name}
  $username    = undef, #: https or ftp username
  $certificate = undef, #: https certificate file
  $password    = undef, #: https or ftp user password or https certificate password
  $environment = undef, #: environment variable for settings such as http_proxy, https_proxy, of ftp_proxy
  $timeout     = undef, #: the the time to wait for the file transfer to complete
  $subdir      = $caller_module_name
) {

  include staging

  if $target {
    $target_file = $target
    $staging_dir = staging_parse($target, 'parent')
  } else {
    $staging_dir = "${staging::path}/${subdir}"
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
    timeout     => $timeout,
    logoutput   => on_failure,
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
