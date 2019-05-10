class eventmachine($version) {
	package{'ruby-devel':
		provider => yum,
		ensure => true,
	}
}
