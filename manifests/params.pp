class staging::params {
  case $::osfamily {
    default: {
      $path          = '/opt/staging'
      $owner         = '0'
      $group         = '0'
      $mode          = '0755'
      $exec_path     = '/usr/local/bin:/usr/bin:/bin'
      $exec_provider = undef
    }
    'windows': {
      $path          = 'C:\staging'
      $owner         = undef
      $group         = undef
      $mode          = '0755'
      $exec_path     = undef
      $exec_provider = powershell
    }
    'solaris': {
      $path          = '/opt/staging'
      $owner         = '0'
      $group         = '0'
      $mode          = '0755'
      $exec_path     = '/usr/local/bin:/usr/bin:/bin:/opt/csw/bin'
      $exec_provider = undef
    }
  }
}
