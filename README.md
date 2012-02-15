# puppet-staging

Puppet management of staging directory, along with retrieval/extraction of staging files.

## Usage

Specify a different default staging path (must be declared before using resource):

    class { 'staging':
      path  => '/var/staging',
      owner => 'puppet',
      group => 'puppet',
    }

Staging files from various sources:

    staging::file { 'sample':
      source => 'puppet://modules/staging/sample',
    }

    staging::file { 'apache-tomcat-6.0.35':
      source => 'http://apache.cs.utah.edu/tomcat/tomcat-6/v6.0.35/bin/apache-tomcat-6.0.35.tar.gz',
    }


Staging and extracting files:

    staging::file { 'sample.tar.gz':
      source => 'puppet:///modules/staging/sample.tar.gz'
    }

    staging::extract { 'sample.tar.gz':
      target  => '/tmp/staging',
      creates => '/tmp/staging/sample',
      require => Staging::File['sample.tar.gz'],
    }

Staging files currently support the following source:

* http(s)://
* puppet://
* ftp://
* local (though this doesn't serve any real purpose.)

I'm considering support for additional protocols such as rsync and git.

## Requirement

This module requires hiera on the puppet master (no changes to puppet agent) with puppet backend and data as the datasource (default setting):

    ---
    :backend: - puppet

    :puppet:
        :datasource: data

If you don't have hiera in your environment either module with the appropriate manifests will deploy hiera on the puppet master:

* [puppet-hiera](https://github.com/nanliu/puppet-hiera)

    class { 'hiera':
      confdir    => '/etc/puppet',
      modulepath => '/etc/puppet/modules',
    }

* [puppetlabs-puppet](https://github.com/puppetlabs/puppetlabs-puppet)

    class { 'puppet::hiera':
      confdir    => '/etc/puppet',
      modulepath => '/etc/puppet/modules',
    }
