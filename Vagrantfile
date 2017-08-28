# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.3"

  dataDisk1 = './dataDisk1.vdi'
  dataDisk2 = './dataDisk2.vdi'
  dataDisk3 = './dataDisk3.vdi'
  dataDisk4 = './dataDisk4.vdi'

   config.vm.provider "virtualbox" do |vb|
     # MB
     vb.memory = "1024"


     # Create data disks if not present, 1GB
     if not File.exists?(dataDisk1)
       vb.customize ['createhd', '--filename', dataDisk1, '--variant', 'Fixed', '--size', 1 * 1024]
     end
     if not File.exists?(dataDisk2)
       vb.customize ['createhd', '--filename', dataDisk2, '--variant', 'Fixed', '--size', 1 * 1024]
     end
     if not File.exists?(dataDisk3)
       vb.customize ['createhd', '--filename', dataDisk3, '--variant', 'Fixed', '--size', 1 * 1024]
     end
     if not File.exists?(dataDisk4)
       vb.customize ['createhd', '--filename', dataDisk4, '--variant', 'Fixed', '--size', 1 * 1024]
     end

   # Adding a SATA controller that allows 4 hard drives
#      vb.customize ['storagectl', :id, '--name', 'SATA Controller', '--add', 'sata', '--portcount', 4]

   # and attach them
#	vb.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', dataDisk1]
#	vb.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', dataDisk2]
#	vb.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', dataDisk3]
#	vb.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 4, '--device', 0, '--type', 'hdd', '--medium', dataDisk4]

   end
  
  config.vm.provision :shell, path: "provision.sh"

end
