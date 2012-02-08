# puppet-staging

Puppet management of staging directory, along with retrieval/extraction of staging files.

## Usage

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

Staging files currently support the following source:

* http(s)://
* puppet://
* ftp://
* local (though this doesn't serve any real purpose.)

I'm considering support for additional protocols such as rsync and git.

## Requirement

This module requires hiera support on the puppet master (no changes to puppet agent) with puppet backend and data as the datasource:

    ---
    :backend: - puppet
    
    :puppet:
        :datasource: data

If you don't have hiera in your environment the [puppetlabs-puppet module](https://github.com/puppetlabs/puppetlabs-puppet) and following manifest will implement hiera on the puppet master:

    class { 'puppet::hiera':
      confdir    => '/etc/puppet',
      modulepath => '/etc/puppet/modules',
    }
