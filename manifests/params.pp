class staging::params {
  case $::osfamily {
    default: {
      $path  = '/opt/staging'
      $owner = '0'
      $group = '0'
      $mode  = '0755'
    }
    'windows': {
      $path  = 'C:\staging'
      $owner = undef
      $group = undef
      $mode  = '0755'
    }
  }
}
