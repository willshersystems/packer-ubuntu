#!/bin/sh -eux

apt-get -y install open-vm-tools
# The rest is for the hgfs module
mkdir /tmp/vmfusion
mkdir /tmp/vmfusion-archive
mount -o loop /home/vagrant/linux.iso /tmp/vmfusion
tar xzf /tmp/vmfusion/VMwareTools-*.tar.gz -C /tmp/vmfusion-archive
/tmp/vmfusion-archive/vmware-tools-distrib/vmware-install.pl --default
umount /tmp/vmfusion
rm -rf  /tmp/vmfusion
rm -rf  /tmp/vmfusion-archive
rm /home/vagrant/*.iso
# Enable auto kmod building
echo "answer AUTO_KMODS_ENABLED yes" >>/etc/vmware-tools/locations

