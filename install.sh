# apt-get -y update && apt-get -y upgrade && \
# apt-get -y install build-essential
# apt-get -y install python3-venv python3-dev
# apt-get -y install postgresql
apt-get -y install apache2
# apt-get -y install git

#####
# all of data go to local
#
# virtual machine directory /vagrant is the host machine directory which has Vagrantfile
#####

# apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  mkdir -p /vagrant/shared/www && ln -fs /vagrant/shared/www /var/www
fi

# postgres


# create python 3 virtual environment
# cd /home/ubuntu && rm -rf /home/ubuntu/py35venv && python3 -mvenv --copies py35venv && /home/ubuntu/py35venv/bin/python -mpip install -U pip

# install pgadmin4
# cd /home/ubuntu && wget https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v1.5/pip/pgadmin4-1.5-py2.py3-none-any.whl && /home/ubuntu/py35venv/bin/python -mpip install pgadmin4-1.5-py2.py3-none-any.whl
