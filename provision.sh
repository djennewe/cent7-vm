#!/usr/bin/env bash
vgdo="sudo -u vagrant"

### System config
hostnamectl set-hostname cent7
# epel
#wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm
#rpm -ivh epel-release-7-10.noarch.rpm
sudo yum -y install epel-release

### ZFS
#wget http://download.zfsonlinux.org/epel/zfs-release.el7_3.noarch.rpm
#sudo gpg --quiet --with-fingerprint /etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux
#sudo rpm -ivh zfs-release.el7_3.noarch.rpm
#sudo yum install -y zfs kernel-devel
#
#sudo /sbin/modprobe zfs
#sudo systemctl enable zfs-import-cache zfs-import-scan zfs-mount zfs-share zfs-zed zfs.target
#sudo zpool status

### Yum Update
sudo yum -y update

### Singularity
# http://singularity.lbl.gov
sudo yum -y groupinstall "Development tools"
sudo yum -y install curl git sudo man vim autoconf libtool
git clone https://github.com/singularityware/singularity.git
cd singularity
./autogen.sh
./configure --prefix=/usr/local
make
sudo make install

### Anaconda3
ANACONDA="Anaconda3-4.4.0-Linux-x86_64.sh"
wget --quiet --no-check-certificate https://repo.continuum.io/archive/$ANACONDA -O anaconda.sh
$vgdo bash anaconda.sh -b -p /home/vagrant/anaconda3
conda="/home/vagrant/anaconda3/bin/conda"
$vgdo $conda update conda -y
#bioconda
$vgdo $conda config --add channels r
$vgdo $conda config --add channels defaults
$vgdo $conda config --add channels conda-forge
$vgdo $conda config --add channels bioconda

### Spack
$vgdo git clone https://github.com/llnl/spack.git /home/vagrant/spack

### linuxbrew
#sudo yum -y install ruby
#$vgdo ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
#$vgdo echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >>/home/vagrant/.bash_profile
#$vgdo echo 'export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"' >>/home/vagrant/.bash_profile
#$vgdo echo 'export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"' >>/home/vagrant/.bash_profile
