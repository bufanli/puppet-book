$lunch = ['egg','beans','chips']
node 'master'{
	file { '/tmp/hello':
		content => "hello,master\n",
	}
	include puppet
	include memcached 
	lunchprint {$lunch:}
}
node 'slave'{
	file { '/tmp/hello':
		content => "hello,slave\n",
	}
	include puppet
	include memcached 
	lunchprint {$lunch:}
}
define lunchprint() {
	notify {"lunch included ${name}":}
}
