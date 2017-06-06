# apt-get -y update && apt-get -y upgrade && \
apt-get -y install build-essential
apt-get -y install python3-venv python3-dev
apt-get -y install postgresql libpq-dev
apt-get -y install apache2 libapache2-mod-wsgi-py3
apt-get -y install git
apt-get -y install rabbitmq-server
# python lxml
apt-get -y install libxml2-dev libxslt1-dev
# python pillow
apt-get -y install libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-tk

#####
# all of data go to local
# 
# virtual machine directory /vagrant is the host machine directory which has Vagrantfile
# make sure the shared directory mode is 777
#
#####

# apache2
if ! [ -L /var/www ]; then
  mv /var/www /var/www.bak
  mkdir -p /vagrant/shared/www/html && ln -fs /vagrant/shared/www /var/www
fi

# postgres
# if ! [ -L /var/lib/postgresql ]; then
#   rsync -av /var/lib/postgresql /vagrant/shared
#   mv /var/lib/postgresql /var/lib/postgresql.bak
#   ln -fs /vagrant/shared/postgresql /var/lib/postgresql
#   chown postgres:postgres /var/lib/postgresql
# fi
