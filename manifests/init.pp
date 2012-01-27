# Class: stage
#
class staging (
  $path  = hiera('staging_path', '/opt/staging'),
  $owner = hiera('staging_owner', '0'),
  $group = hiera('staging_group', '0'),
  $mode  = hiera('staging_mode', '0755'),
) {

  file { $path:
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
  }

}
