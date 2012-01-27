# Define: staging::file
#
#   Define resource to retrieve files to staging directories. It is
#   intententionally not replacing files, as these intend to be large binaries
#   that are versioned.
#
# Paremeters:
#
#   * source: the source file location, supports local files, puppet://, and http://
#   * target: the target staging directory, if unspecified ${staging::path}/${caller_module_name}.
#
define staging::file (
  $source,
  $target = undef,
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
        source => $source,
        replace  => false,
      }
    }
    /^puppet:\/\//: {
      file { $file_path:
        source   => $source,
        replace  => false,
      }
    }
    /^http:\/\//: {
      exec { $file_path:
        command => "curl -o ${name} ${source}",
        path    => '/usr/local/bin:/usr/bin:/bin',
        cwd     => $staging_path,
        creates => "$file_path"
      }
    }

    default: {
      fail("stage::file: do not recognize source ${source}.")
    }
  }

}
