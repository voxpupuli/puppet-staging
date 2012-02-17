# Define: staging::deploy
#
#   Define resource to retrieve compressed files to deploy to target directories.
#
# Parameters:
#
#   * source: the source file location, supports local files, puppet://,
#   http://, https://, ftp://
#   * target: the target extraction directory.
#   * staging_path: the staging location for compressed file. defaults to
#   ${staging::path}/${caller_module_name}.
#   * username: https or ftp username.
#   * certificate: https certificate file.
#   * password: https or ftp user password or https certificate password.
#   * environment: environment variable for settings such as http_proxy,
#   https_proxy, of ftp_proxy.
#   * timeout: the the time to wait for the file transfer to complete
#   * user: extract file as this user.
#   * group: extract file as this group.
#   * creates: the file created after extraction. if unspecified defaults to
#   ${target}/${name}.
#   * unless: alternative way to conditionally check whether to extract file.
#   * onlyif: alternative way to conditionally check whether to extract file.
#
# Usage:
#
#   staging::deploy { 'jboss-5.1.0.GA.zip':
#     source => 'http://sourceforge.net/projects/jboss/files/JBoss/JBoss-5.1.0.GA/jboss-5.1.0.GA.zip',
#     target => '/usr/local',
#   }
#
define staging::deploy (
  $source,
  $target,
  $staging_path = undef,
  # staging file settings:
  $username     = undef,
  $certificate  = undef,
  $password     = undef,
  $environment  = undef,
  $timeout      = undef,
  # staging extract settings:
  $user         = undef,
  $group        = undef,
  $creates      = undef,
  $unless       = undef,
  $onlyif       = undef,
){

  staging::file { $name:
    source      => $source,
    target      => $staging_path,
    username    => $username,
    certificate => $certificate,
    password    => $password,
    environment => $environment,
    subdir      => $caller_module_name,
    timeout     => $timeout,
  }

  staging::extract { $name:
    target      => $target,
    source      => $staging_path,
    user        => $user,
    group       => $group,
    environment => $environment,
    subdir      => $caller_module_name,
    creates     => $creates,
    unless      => $unless,
    onlyif      => $onlyif,
    require     => Staging::File[$name],
  }

}
