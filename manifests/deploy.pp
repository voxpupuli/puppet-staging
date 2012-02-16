define staging::deploy (
  $source,
  $target,
  $staging_path = undef,
  # staging file settings:
  $username     = undef,
  $certificate  = undef,
  $password     = undef,
  $environment  = undef,
  # staging extract settings:
  $user         = undef,
  $group        = undef,
  $creates      = undef,
  $unless       = undef,
  $onlyif       = undef,
){

  staging::file { $name:
    source             => $source,
    target             => $staging_path,
    username           => $username,
    certificate        => $certificate,
    password           => $password,
    environment        => $environment,
    caller_module_name => $caller_module_name,
  }

  staging::extract { $name:
    target             => $target,
    source             => $staging_path,
    user               => $user,
    group              => $group,
    environment        => $environment,
    caller_module_name => $caller_module_name,
    creates            => $creates,
    unless             => $unless,
    onlyif             => $onlyif,
    require            => Staging::File[$name],
  }

}

