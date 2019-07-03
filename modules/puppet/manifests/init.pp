class puppet{
	$interface = {
		'name' => 'eth0',
		'address' => '192.168.100.101',
		}
	notify { "Interface ${interface['name']} has address
			${interface['address']}" :}
	file { '/usr/local/bin/papply':
		source => 'puppet:///modules/puppet/papply.sh',
		mode => '0755',
	}
	file { '/usr/local/bin/pull-updates':
		source => 'puppet:///modules/puppet/pull-updates.sh',
		mode => '0755',
	}
	file { '/home/bufanli/.ssh/id_rsa':
		source => 'puppet:///modules/puppet/id_rsa',
		owner => 'bufanli',
		mode => '0600',
	}
	cron { 'run-puppet':
		ensure => present,
		user => 'bufanli',
		command => '/usr/local/bin/pull-updates',
		minute => '*/10',
		hour => '*',
	}
}
