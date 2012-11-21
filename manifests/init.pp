#   This module manages staging and extraction of files from various sources.
#
# #### Actions:
#
#   Creates the root staging directory. By default files will be created in a subdirectory matching the caller_module_name.
#
#      /opt/staging/
#                 |-- puppet
#                 |   `-- puppet.enterprise.2.0.tar.gz
#                 `-- tomcat
#                     `-- tomcat.5.0.tar.gz
#
class staging (
  $path  = '/opt/staging', #: staging directory filepath
  $owner = '0',            #: staging directory owner
  $group = '0',            #: staging directory group
  $mode  = '0755'          #: staging directory permission
) {

  file { $path:
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
  }

}
