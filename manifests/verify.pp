# Define resource to verify checksums of files in staging directories
define staging::verify (
  $checksum,
  $algorithm = 'sha1',
  $subdir    = $caller_module_name,
  $refreshonly = undef,
) {
  include staging

  $staging_dir = "${staging::path}/${subdir}"
  $command = "${algorithm}sum --check --quiet --status"

  Exec {
    path        => $staging::exec_path,
    cwd         => $staging_dir,
    logoutput   => on_failure,
    refreshonly => $refreshonly,
  }

  exec { "verify ${name} with ${algorithm}":
    command => "echo '${checksum}  ${name}' | ${command}",
  }
}
