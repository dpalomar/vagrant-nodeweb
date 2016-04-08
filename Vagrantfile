# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

 
   config.vm.network "forwarded_port", guest: 3000, host: 3000
   config.vm.network "forwarded_port", guest: 3001, host: 3001

 
   config.vm.synced_folder "./", "/home/vagrant/projects", id: "vagrant-root",
   :owner => "vagrant",
   :mount_options => ["dmode=775","fmode=664"]

  
   config.vm.provider "virtualbox" do |vb|
  
     vb.memory = "1024"
   end
 

  
  config.vm.provision :shell, :path => "provision.sh", privileged: false
  config.vm.provision "file", source: "tmux.conf", destination: "/home/vagrant/.tmux.conf"
  config.vm.provision "file", source: "README_FIRST.txt", destination: "/home/vagrant/README_FIRST"
  
end
