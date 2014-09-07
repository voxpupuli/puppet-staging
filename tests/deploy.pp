staging::deploy { 'sample.tar.gz':
  source   => 'puppet:///modules/staging/sample.tar.gz',
  target   => '/usr/local',
  checksum => 'e4ad1353b2becccbc9ff49d10b8980f17eadce57',
}
