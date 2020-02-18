Vagrant.configure("2") do |config|
  config.vbguest.auto_update = false
  config.vm.box_check_update = false

  config.vm.define "lb" do |lb|
    lb.vm.box = "centos/7"
    lb.vm.network "private_network", ip: "192.168.10.250"
    lb.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ["modifyvm", :id, "--memory", "512"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    end
  end

  config.vm.define "gitlab" do |vm|
    vm.vm.box = "centos/7"
    vm.vm.network "private_network", ip: "192.168.10.220"
    vm.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--memory", "3072"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
    end
  end

  config.vm.define "nfs-server" do |node|
    node.vm.box = "centos/7"
    node.vm.network "private_network", ip: "192.168.10.210"
    node.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ["modifyvm", :id, "--memory", "512"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    end
  end

  config.vm.define "master-1" do |master|
    master.vm.box = "centos/7"
    master.vm.network "private_network", ip: "192.168.10.101"
    master.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    end
  end

  config.vm.define "master-2" do |master|
    master.vm.box = "centos/7"
    master.vm.network "private_network", ip: "192.168.10.102"
    master.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--memory", "4096"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    end
  end

  config.vm.define "node-1" do |node|
    node.vm.box = "centos/7"
    node.vm.network "private_network", ip: "192.168.10.201"
    node.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--memory", "6144"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    end
  end

  config.vm.define "node-2" do |node|
    node.vm.box = "centos/7"
    node.vm.network "private_network", ip: "192.168.10.202"
    node.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--memory", "2056"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    end
  end
end
