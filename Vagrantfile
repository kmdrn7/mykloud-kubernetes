Vagrant.configure("2") do |config|
  config.vbguest.auto_update = false
  config.vm.box_check_update = false
  config.vm.provision "file", source: "/homelab/vms/keys/vagrant_centos.pub", destination: "~/.ssh/centos.pub"
  config.vm.provision "shell", inline: <<-SHELL
    cat /home/vagrant/.ssh/centos.pub >> /home/vagrant/.ssh/authorized_keys
  SHELL

  config.vm.define "haproxy" do |vm|
    vm.vm.box = "centos/7"
    vm.vm.hostname = "haproxy"
    vm.vm.network "private_network", ip: "192.168.10.252"
    vm.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ["modifyvm", :id, "--memory", "512"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "40"]
    end
  end

  config.vm.define "dns" do |dns|
    dns.vm.box = "centos/7"
    dns.vm.hostname = "dns"
    dns.vm.network "private_network", ip: "192.168.10.251"
    dns.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ["modifyvm", :id, "--memory", "256"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "40"]
    end
  end

  config.vm.define "nfs-server" do |node|
    node.vm.box = "centos/7"
    node.vm.hostname = "nfs-server"
    node.vm.network "private_network", ip: "192.168.10.12"
    node.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ["modifyvm", :id, "--memory", "256"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "40"]
    end
  end

  config.vm.define "master-1" do |master|
    master.vm.box = "centos/7"
    master.vm.hostname = "master-1"
    master.vm.network "private_network", ip: "192.168.10.21"
    master.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "40"]
    end
  end

  config.vm.define "master-2" do |master|
    master.vm.box = "centos/7"
    master.vm.hostname = "master-2"
    master.vm.network "private_network", ip: "192.168.10.22"
    master.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "40"]
    end
  end

  config.vm.define "master-3" do |master|
    master.vm.box = "centos/7"
    master.vm.hostname = "master-3"
    master.vm.network "private_network", ip: "192.168.10.33"
    master.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "40"]
    end
  end

  config.vm.define "node-1" do |node|
    node.vm.box = "centos/7"
    node.vm.hostname = "node-1"
    node.vm.network "private_network", ip: "192.168.10.31"
    node.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--memory", "4096"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    end
  end

  config.vm.define "node-2" do |node|
    node.vm.box = "centos/7"
    node.vm.hostname = "node-2"
    node.vm.network "private_network", ip: "192.168.10.32"
    node.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    end
  end

end
