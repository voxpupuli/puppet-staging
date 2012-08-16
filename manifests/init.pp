# Class: staging
#
#   This module manages staging and extraction of files from various sources.
#
# Parameters:
#
#   * path: staging directory (/opt/staging).
#   * owner: staging directory owner (root).
#   * group: staging directory group (root).
#   * mode: staging directory permission (0755).
#
# Actions:
#
#   Creates the root staging directory. By default files will be created in a
#   subdirectory matching the caller_module_name.
#
#   /opt/staging/
#               |-- puppet
#               |   `-- puppet.enterprise.2.0.tar.gz
#               `-- tomcat
#                   `-- tomcat.5.0.tar.gz
#
# Requires:
#
class staging (
  $path  = '/opt/staging',
  $owner = '0',
  $group = '0',
  $mode  = '0755'
) {

  file { $path:
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
  }

}
