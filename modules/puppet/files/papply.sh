#!/bin/sh
sudo puppet apply /home/bufanli/puppet-book/manifests/site.pp --modulepath=/home/bufanli/puppet-book/modules/ $*
