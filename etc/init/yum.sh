sudo yum update -y
sudo yum groupinstall -y "Development Tools"

sudo yum install -y centos-release-scl
sudo yum-config-manager --enable rhel-server-rhscl-7-rpms

sudo yum install -y devtoolset-6

echo 'source /opt/rh/devtoolset-6/enable' > /tmp/devtoolset-6.sh
sudo chown root.root /tmp/devtoolset-6.sh
sudo mv /tmp/devtoolset-6.sh /etc/profile.d/
