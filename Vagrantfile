# -*- mode: ruby -*-
# vi: set ft=ruby :
# vi: set nu :

Vagrant.configure(2) do |config|
  config.vm.define 'ubuntu', primary: true do |ubuntu|
    ubuntu.ssh.port = 22
    ubuntu.ssh.username = 'vagrant'
    ubuntu.ssh.password = '123'
    ubuntu.ssh.forward_x11 = true
    ubuntu.vm.provider 'docker' do |docker|
      docker.image = 'uralbash/ubuntu'
      docker.name = 'uralbash-ubuntu-test'
      docker.build_args = ['--tag=uralbash/ubuntu-test']
      docker.remains_running = false

      # -t - Allocate a (pseudo) tty
      # -i - Keep stdin open (so we can interact with it)
      docker.create_args = ['-i', '-t']
      docker.has_ssh = true
    end
  end
end
