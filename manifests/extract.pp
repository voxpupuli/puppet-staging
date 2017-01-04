# Define resource to extract files from staging directories to target directories.
define staging::extract (
  $target,              #: the target extraction directory
  $source      = undef, #: the source compression file, supports tar, tar.gz, zip, war
  $creates     = undef, #: the file created after extraction. if unspecified defaults ${staging::path}/${caller_module_name}/${name} ${target}/${name}
  $unless      = undef, #: alternative way to conditionally check whether to extract file.
  $onlyif      = undef, #: alternative way to conditionally check whether to extract file.
  $user        = undef, #: extract file as this user.
  $group       = undef, #: extract file as this group.
  $environment = undef, #: environment variables.
  $strip       = undef, #: extract file with the --strip=X option. Only works with GNU tar.
  $use_7zip    = false, #: alternative to unzip command on Windows
  $unzip_opts  = '',    #: additional options to pass the unzip command.
  $untar_opts  = '',    #: additional options to pass to tar.
  $subdir      = $caller_module_name #: subdir per module in staging directory.
) {

  include ::staging

  if $source {
    $source_path = $source
  } else {
    if $subdir == '' { # eg when $caller_module_name is blank
      $source_path = "${staging::_path}/${name}"
    } else {
      $source_path = "${staging::_path}/${subdir}/${name}"
    }
  }

  # Use user supplied creates path, set default value if creates, unless or
  # onlyif is not supplied.
  if $creates {
    $creates_path = $creates
  } elsif ! ($unless or $onlyif) {
    if $name =~ /.tar.gz$/ {
      $folder       = staging_parse($name, 'basename', '.tar.gz')
    } elsif $name =~ /.tar.bz2$/ {
      $folder       = staging_parse($name, 'basename', '.tar.bz2')
    } else {
      $folder       = staging_parse($name, 'basename')
    }
    $creates_path = "${target}/${folder}"
  } else {
    $creates_path = undef
  }

  if scope_defaults('Exec','path') {
    Exec{
      cwd         => $target,
      user        => $user,
      group       => $group,
      environment => $environment,
      creates     => $creates_path,
      unless      => $unless,
      onlyif      => $onlyif,
      logoutput   => on_failure,
    }
  } else {
    Exec{
      path        => $::path,
      cwd         => $target,
      user        => $user,
      group       => $group,
      environment => $environment,
      creates     => $creates_path,
      unless      => $unless,
      onlyif      => $onlyif,
      logoutput   => on_failure,
    }
  }

  if $strip {
    if $::osfamily == 'Solaris' or $name !~ /(.tar|.tgz|.tar.gz|.tbz2|.tar.bz2)$/ {
      warning('strip is only supported with GNU tar, ignoring the parameter')
      $strip_opt = ''
    } else {
      $strip_opt = " --strip=${strip}"
    }
  } else {
    $strip_opt = ''
  }

  if $untar_opts != '' {
      $untar_opts_real = " ${untar_opts}"
  } else {
      $untar_opts_real = ''
  }

  case $name {
    /.tar$/: {
      $command = "tar xf ${source_path}${strip_opt}${untar_opts_real}"
    }

    /(.tgz|.tar.gz)$/: {
      if $::osfamily == 'Solaris' {
        $command = "gunzip -dc < ${source_path} | tar xf - ${untar_opts_real}"
      } else {
        $command = "tar xzf ${source_path}${strip_opt}${untar_opts_real}"
      }
    }

    /(.tbz2|.tar.bz2)$/: {
      $command = "tar xjf ${source_path}${strip_opt}${untar_opts_real}"
    }

    /.zip$/: {
      if $use_7zip {
        $command = "7z x ${source_path} ${unzip_opts}"
      } else {
        $command = "unzip ${unzip_opts} ${source_path}"
      }
    }

    /(.war|.jar)$/: {
      $command = "jar xf ${source_path}"
    }

    /.deb$/: {
      if $::osfamily == 'Debian' {
        $command = "dpkg --extract ${source_path} ."
      } else {
        fail('The .deb filetype is only supported on Debian family systems.')
      }
    }

    /.Z$/: {
      $command = "uncompress ${source_path}"
    }

    default: {
      fail("staging::extract: unsupported file format ${name}.")
    }
  }

  exec { "extract ${name}":
    command => $command,
  }
}
