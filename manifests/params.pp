class staging::params {
  case $::osfamily {
    default: {
      $path  = '/opt/staging'
      $owner = '0'
      $group = '0'
      $mode  = '0755'
    }
    'windows': {
      $path  = $::staging_windir
      $owner = undef
      $group = undef
      $mode  = '0755'
    }
  }
}
