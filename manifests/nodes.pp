node 'master'{
	file { '/tmp/hello':
		content => "hello,master\n",
	}
}
node 'slave'{
	file { '/tmp/hello':
		content => "hello,slave\n",
	}
}
