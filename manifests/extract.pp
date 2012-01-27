# Define: staging::extract
#
#   Define resource to extract files from staging directories to target directories.
#
# Paremeters:
#
#   * target: the target extraction directory,
#   * source: the source compression file, supports tar, tar.gz, zip, war. if unspecified defaults to ${staging::path}/${caller_module_name}/${name}
#   * creates: the file created after extraction. if unspecified defaults to ${target}/${name}.
#   * username: extract the compressed file under this user account.
#
define staging::extract (
  $target,
  $source  = undef,
  $creates = undef,
  $user    = undef,
  $group   = undef,
) {
  include staging

  if $source {
    $source_path = $source
  } else {
    $source_path = "${staging::path}/${caller_module_name}/${name}"
  }

  if $creates {
    $creates_path = $creates
  } else {
    $creates_path = "${target}/${name}"
  }

  case $name {
    /.tar$/: {
      exec { "extract ${name}":
        command   => "tar xf ${source_path}",
        path      => '/usr/bin:/bin',
        cwd       => $target,
        user      => $user,
        group     => $group,
        creates   => $creates_path,
        logoutput => on_failure,
      }
    }
    /.tar.gz$/: {
      exec { "extract ${name}":
        command   => "tar xzf ${source_path}",
        path      => '/usr/bin:/bin',
        cwd       => $target,
        user      => $user,
        group     => $group,
        creates   => $creates_path,
        logoutput => on_failure,
      }
    }
    /.zip$/: {
      exec { "extract ${name}":
        command   => "unzip ${source_path}",
        path      => '/usr/bin:/bin',
        cwd       => $target,
        user      => $user,
        group     => $group,
        creates   => $creates_path,
        logoutput => on_failure,
      }
    }
    /.war$/: {
      exec { "extract ${name}":
        command   => "${quote}jar xf ${source_path}",
        path      => '/usr/bin:/bin',
        cwd       => $target,
        user      => $user,
        group     => $group,
        creates   => $creates_path,
        logoutput => on_failure,
      }
    }
    default: {
      fail("staging::extract: unsupported file format ${name}.")
    }
  }

}
