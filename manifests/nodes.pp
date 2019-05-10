$lunch = ['egg','beans','chips']
node 'server' {
}
node 'master' inherits 'server'{
	file { '/tmp/hello':
		content => "hello,master\n",
	}
	include puppet
	include memcached 
	if tagged('server'){
		notify{'this is a server tag':}
	}
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
