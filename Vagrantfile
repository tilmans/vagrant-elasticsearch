# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos64_puppetlabs"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"

  # config.librarian_puppet.puppetfile_dir = "puppet"
  config.vm.define "primary", primary: true do |config|

    config.vm.provision :puppet do |puppet|
      puppet.module_path    = "modules"
      puppet.manifests_path = "puppet"
      puppet.manifest_file  = "es.pp"
      puppet.options        = "--verbose --debug --trace"
    end

    config.vm.network "forwarded_port", guest: 9200, host: 9200
  end

  config.vm.define "secondary", primary: false do |config|

    config.vm.provision :puppet do |puppet|
      puppet.module_path    = "modules"
      puppet.manifests_path = "puppet"
      puppet.manifest_file  = "es.pp"
      puppet.options        = "--verbose --debug --trace"
    end

    config.vm.network "forwarded_port", guest: 9200, host: 9201
  end

end
