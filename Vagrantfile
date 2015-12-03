Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/vivid64"
    config.vm.provision :shell, :path => "provision.sh"
    config.vm.provision :shell, :inline => "apt-get install -y virtualbox-guest-x11"
    config.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        vb.gui = true
        # Customize the amount of memory on the VM:
        vb.memory = "1024"
        # Enable sound support
        # (available options for audiocontroller: "hda", "sb16", "ac97")
        # (available options for audio: "alsa", "pulse" for Linux, "dsound" for Windows, "coreaudio" for Mac OS)
        vb.customize ["modifyvm", :id, '--audio', 'alsa', '--audiocontroller', 'hda']
    end
end

