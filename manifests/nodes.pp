node 'master'{
	file { '/tmp/hello':
		content => "hello,master\n",
	}
	include puppet
}
node 'slave'{
	file { '/tmp/hello':
		content => "hello,slave\n",
	}
	include puppet
}
