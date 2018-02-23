## Set locales
echo Setting locales ......
sudo locale-gen en_US en_US.UTF-8
sudo localedef -i en_US -f UTF-8 en_US.UTF-8

## Install dependencies
echo Installing dependencies ......
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install nodejs -y
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs yarn -y

## Install ruby
echo Installing ruby ......
cd ~
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
rbenv install 2.5.0
rbenv global 2.5.0
ruby -v

## Install bundler
echo Installing bundler ......
gem install bundler
rbenv rehash

## Configure git
echo Configuring git ......
echo Needs to be done manually, check boostrap.sh
# git config --global color.ui true
# git config --global user.name
# git config --global user.email
# ssh-keygen -t rsa -b 4096 -C
# copy ssh: cat ~/.ssh/id_rsa.pub and add to profile
# test: ssh -T git@github.com

# Install rails
echo Installing rails 5.1.4 ......
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
gem install rails -v 5.1.4
rbenv rehash
rails -v

# Install mongodb
echo Installing mongodb ...
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
sudo echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | tee -a /etc/apt/sources.list.d/10gen.list
sudo apt-get -y update
sudo apt-get -y install mongodb
mongo --version


# Create projects directory
echo Creating projects directory
mkdir projects
cd projects
echo Happy Hacking!

# Sources:
# https://gorails.com/setup/ubuntu/16.04
# https://gorails.com/guides/setting-up-rails-4-with-mongodb-and-mongoid
