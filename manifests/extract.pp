# Define: staging::extract
#
#   Define resource to extract files from staging directories to target directories.
#
# Paremeters:
#
#   * target: the target extraction directory,
#   * source: the source compression file, supports tar, tar.gz, zip, war. if unspecified defaults to ${staging::path}/${caller_module_name}/${name}
#   * creates: the file created after extraction. if unspecified defaults to ${target}/${name}.
#
define staging::extract (
  $target,
  $source = undef,
  $creates = undef
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

  Exec {
    logoutput => on_failure,
  }

  case $name {
    /.tar$/: {
      exec { "extract ${name}":
        command => "tar xf ${name}",
        path    => '/usr/bin:/bin',
        cwd     => $target,
        creates => $creates_path,
      }
    }
    /.tar.gz$/: {
      exec { "extract ${name}":
        command => "tar xzf ${name}",
        path    => '/usr/bin:/bin',
        cwd     => $target,
        creates => $creates_path,
      }
    }
    /.zip$/: {
      exec { "extract ${name}":
        command => "zip x ${name}",
        path    => '/usr/bin:/bin',
        cwd     => $target,
        creates => $creates_path,
      }
    }
    /.war$/: {
      exec { "extract ${name}":
        command => "jar x ${name}",
        path    => '/usr/bin:/bin',
        cwd     => $target,
        creates => $creates_path,
      }
    }
    default: {
      fail("staging::extract: unsupported file format ${name}.")
    }
  }

}
