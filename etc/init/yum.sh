sudo yum update -y
sudo yum groupinstall -y "Development Tools"

CENTOS_MAJOR=$(cat /etc/redhat-release | sed -E "s/.*release[^0-9]*([0-9]*).*/\1/")

# Install Software Collections
sudo yum install -y centos-release-scl
sudo yum-config-manager --enable rhel-server-rhscl-${CENTOS_MAJOR}-rpms

## Install devtoolset-6
sudo yum install -y devtoolset-6
echo 'source /opt/rh/devtoolset-6/enable' > /tmp/devtoolset-6.sh
sudo chown root.root /tmp/devtoolset-6.sh
sudo mv /tmp/devtoolset-6.sh /etc/profile.d/

# Install zsh
sudo yum install -y zsh
echo $( cd /etc/yum.repo.d/ && sudo wget http://download.opensuse.org/repositories/shells:zsh-users:zsh-completions/CentOS_${CENTOS_MAJOR}/shells:zsh-users:zsh-completions.repo )
sudo yum install -y zsh-completions
