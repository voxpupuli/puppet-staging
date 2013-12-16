# #### Overview:
#
# Define resource to retrieve files to staging directories. It is
# intententionally not replacing files, as these intend to be large binaries
# that are versioned.
#
# #### Notes:
#
#   If you specify a different staging location, please manage the file
#   resource as necessary.
#
define staging::file (
  $source,              #: the source file location, supports local files, puppet://, http://, https://, ftp://
  $target      = undef, #: the target staging directory, if unspecified ${staging::path}/${caller_module_name}
  $username    = undef, #: https or ftp username
  $certificate = undef, #: https certificate file
  $password    = undef, #: https or ftp user password or https certificate password
  $environment = undef, #: environment variable for settings such as http_proxy, https_proxy, of ftp_proxy
  $timeout     = undef, #: the the time to wait for the file transfer to complete
  $curl_option = undef, #: options to pass to curl
  $wget_option = undef, #: options to pass to wget
  $subdir      = $caller_module_name
) {

  include staging

  $quoted_source = shellquote($source)

  if $target {
    $target_file = $target
    $staging_dir = staging_parse($target, 'parent')
  } else {
    $staging_dir = "${staging::path}/${subdir}"
    $target_file = "${staging_dir}/${name}"

    if ! defined(File[$staging_dir]) {
      file { $staging_dir:
        ensure=>directory,
      }
    }
  }
  $default_path = $osfamily ? {
      'windows' => "${::path}",
      default   => '/usr/local/bin:/usr/bin:/bin'
  }

  Exec {
    path        => $default_path,
    environment => $environment,
    cwd         => $staging_dir,
    creates     => $target_file,
    timeout     => $timeout,
    logoutput   => on_failure,
  }

  case $::staging_http_get {
    'curl', default: {
      $http_get        = "curl ${curl_option} -f -L -o ${name} ${quoted_source}"
      $http_get_passwd = "curl ${curl_option} -f -L -o ${name} -u ${username}:${password} ${quoted_source}"
      $http_get_cert   = "curl ${curl_option} -f -L -o ${name} -E ${certificate}:${password} ${quoted_source}"
      $ftp_get         = "curl ${curl_option} -o ${name} ${quoted_source}"
      $ftp_get_passwd  = "curl ${curl_option} -o ${name} -u ${username}:${password} ${quoted_source}"
    }
    'wget': {
      $http_get        = "wget ${wget_option} -O ${name} ${quoted_source}"
      $http_get_passwd = "wget ${wget_option} -O ${name} --user=${username} --password=${password} ${quoted_source}"
      $http_get_cert   = "wget ${wget_option} -O ${name} --user=${username} --certificate=${certificate} ${quoted_source}"
      $ftp_get         = $http_get
      $ftp_get_passwd  = $http_get_passwd
    }
    'powershell':{
      $http_get        = "powershell.exe -Command \"(New-Object System.Net.WebClient).DownloadFile('${source}','${target_file}')\""
    }
  }

  case $source {
    /^\//: {
      file { $target_file:
        source  => $source,
        replace => false,
      }
    }
    /^puppet:\/\//: {
      file { $target_file:
        source  => $source,
        replace => false,
      }
    }
    /^http:\/\//: {
      if $username { $command = $http_get_passwd }
      else         { $command = $http_get        }
      exec { $target_file:
        path      => $default_path,
        provider  => $provider,
        command   => $command,
      }
    }
    /^https:\/\//: {
      if $username       { $command = $http_get_passwd }
      elsif $certificate { $command = $http_get_cert   }
      else               { $command = $http_get        }
      exec { $target_file:
        path    => $default_path,
        provider=> $provider,
        command => $command,
      }
    }
    /^ftp:\/\//: {
      if $username       { $command = $ftp_get_passwd }
      else               { $command = $ftp_get        }
      exec { $target_file:
        path    => $default_path,
        provider=> $provider,
        command     => $command,
      }
    }
    default: {
      fail("stage::file: do not recognize source ${source}.")
    }
  }

}
