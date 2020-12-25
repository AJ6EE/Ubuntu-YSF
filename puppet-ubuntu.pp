file  { '/etc/YSFReflector.ini':
	ensure => present,
	source => '/root/Ubuntu-YSF/YSFReflector.ini',
	mode => '0644',
}

file { '/var/log/YSFReflector/':
	ensure => directory,
	mode => '0755',
}	

$svcs = [
'apache2',
'YSFReflector',
]

service { $svcs:
	ensure => running,
	enable => true,
}

user { "pi":
    ensure => present,
    groups => [www-data],
}

file  { '/var/www/html/index.html':
	ensure => absent,
}

file { "/var/www/html":
  ensure => directory,
  recurse => true,
  owner => "www-data",
  group => "www-data",
  mode => '0755', 
  }
