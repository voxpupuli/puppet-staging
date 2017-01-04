# The define resource extracts compressed file to a staging location.
define staging::deploy (
  $target,               #: the target extraction directory
  $source       = undef, #: the source file location, supports local files, puppet:///, http://, https://, ftp://
  $staging_path = undef, #: the staging location for compressed file. defaults to ${staging::path}/${caller_module_name}
  $username     = undef, #: https or ftp username
  $certificate  = undef, #: https certifcate file
  $password     = undef, #: https or ftp user password or https certificate password
  $environment  = undef, #: environment variable for settings such as http_proxy
  $novalidate   = false, #: Whether to bypass https validation - powershell only
  $strip        = undef, #: extract file with the --strip=X option. Only works with GNU tar.
  $use_7zip     = false, #: alternative to unzip command on Windows
  $unzip_opts   = '',    #: additional options to pass the unzip command.
  $untar_opts   = '',    #: additional options to pass to tar.
  $timeout      = undef, #: the time to wait for the file transfer to complete
  $user         = undef, #: extract file as this user
  $group        = undef, #: extract group as this group
  $creates      = undef, #: the file/folder created after extraction. if unspecified defaults to ${target}/${name}
  $unless       = undef, #: alternative way to conditionally extract file
  $onlyif       = undef  #: alternative way to conditionally extract file
) {

  # grab file name if path was passed in
  if $name =~ /.*\/(.*)/ {
    $file_name = $1
  } else {
    $file_name = $name
  }

  if $source {
    $source_path = $source
  } else {
    $source_path = $name
  }

  staging::file { $file_name:
    source      => $source_path,
    target      => $staging_path,
    username    => $username,
    certificate => $certificate,
    password    => $password,
    environment => $environment,
    novalidate  => $novalidate,
    subdir      => $caller_module_name,
    timeout     => $timeout,
  }

  staging::extract { $file_name:
    target      => $target,
    source      => $staging_path,
    user        => $user,
    group       => $group,
    environment => $environment,
    strip       => $strip,
    use_7zip    => $use_7zip,
    unzip_opts  => $unzip_opts,
    untar_opts  => $untar_opts,
    subdir      => $caller_module_name,
    creates     => $creates,
    unless      => $unless,
    onlyif      => $onlyif,
    require     => Staging::File[$file_name],
  }

}
