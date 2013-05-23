# The define resource extracts compressed file to a staging location.
define staging::deploy (
  $source,               #: the source file location, supports local files, puppet://, http://, https://, ftp://
  $target,               #: the target extraction directory
  $staging_path    = undef, #: the staging location for compressed file. defaults to ${staging::path}/${caller_module_name}
  $username        = undef, #: https or ftp username
  $certificate     = undef, #: https certifcate file
  $password        = undef, #: https or ftp user password or https certificate password
  $environment     = undef, #: environment variable for settings such as http_proxy
  $timeout         = undef, #: the time to wait for the file transfer to complete
  $extract_timeout = undef, #: the time to wait for the extraction to complete
  $user            = undef, #: extract file as this user
  $group           = undef, #: extract group as this group
  $creates         = undef, #: the file/folder created after extraction. if unspecified defaults to ${target}/${name}
  $unless          = undef, #: alternative way to conditionally extract file
  $onlyif          = undef  #: alternative way to conditionally extract file
) {

  $use_extract_timeout = $extract_timeout ? {
    undef   => $timeout,         # default to the same as $timeout if unset
    default => $extract_timeout, # otherwise, use it as-is if set
  }

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
    timeout     => $use_extract_timeout,
    unless      => $unless,
    onlyif      => $onlyif,
    require     => Staging::File[$name],
  }

}
