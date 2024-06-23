# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_version = "20191107.0.0"
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 256]
  end

  config.vm.define :haproxy1, primary: true do |haproxy1_config|
    haproxy1_config.vm.hostname = 'haproxy1'  
    haproxy1_config.vm.network :private_network, ip: "192.168.56.9"
    haproxy1_config.vm.provision "shell" do |s|
      s.env = { 
        "private_ip" => "192.168.56.9",
        "peer_ip" => "192.168.56.10"
      }
      s.path = "haproxy-setup.sh"
      s.args = "101"
    end
  end

  config.vm.define :haproxy2, primary: true do |haproxy2_config|
    haproxy2_config.vm.hostname = 'haproxy2'
    haproxy2_config.vm.network :private_network, ip: "192.168.56.10"
    haproxy2_config.vm.provision "shell" do |s|
      s.env = { 
        "private_ip" => "192.168.56.10", 
        "peer_ip" => "192.168.56.9"
      }
      s.path = "haproxy-setup.sh"
      s.args = "100"
    end
  end

  config.vm.define :web1 do |web1_config|
    web1_config.vm.hostname = 'web1'
    web1_config.vm.network :private_network, ip: "192.168.56.11"
    web1_config.vm.provision :shell,
                             :path => "web-setup.sh",
                             :env => { "private_ip" => "192.168.56.11" }
  end

  config.vm.define :web2 do |web2_config|
    web2_config.vm.hostname = 'web2'
    web2_config.vm.network :private_network, ip: "192.168.56.12"
    web2_config.vm.provision :shell,
                             :path => "web-setup.sh",
                             :env => { "private_ip" => "192.168.56.12" }
  end
end
