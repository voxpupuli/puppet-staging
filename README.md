# puppet-staging

Puppet staging files management.

## Usage

This module requires hiera with puppet backend and data as the datasource:

    ---
    :backend: - puppet
    
    :puppet:
        :datasource: data

Specify a different staging path (must be declared before using resource):

    class { 'staging':
      path => '/var/staging',
    }

    staging::file { 'sample':
      source => 'http://server/sample',
    }

    staging::extract { 'sample.tar.gz':
      target  => '/tmp',
      creates => '/tmp/sample',
    }
