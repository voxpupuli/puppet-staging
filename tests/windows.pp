class { 'staging':
  path  => 'c:/ProgramData/PuppetLabs/staging',
  owner => 'Administrator',
  group => 'Administrators',
}

staging::file { '7z.msi':
  source => 'http://downloads.sourceforge.net/sevenzip/7z920-x64.msi',
}

package { '7z':
  ensure  => present,
  source  => 'C:\\Programdata\\PuppetLabs\\staging\\7z.msi',
  require => Staging::File['7z.msi'],
}
