apt-get install -y libapache2-mod-wsgi

cat > /home/ubuntu/py35venv/lib/python3.5/site-packages/pgadmin4/config_local.py <<EOF
SERVER_MODE = True
LOG_FILE = '/var/log/pgadmin4/pgadmin4.log'
SQLITE_PATH = '/var/lib/pgadmin4/pgadmin4.db'
SESSION_DB_PATH = '/var/lib/pgadmin4/sessions'
STORAGE_DIR = '/var/lib/pgadmin4/storage'
EOF

/home/ubuntu/py35venv/bin/python /home/ubuntu/py35venv/lib/python3.5/site-packages/pgadmin4/setup.py

chown www-data:www-data /var/lib/pgadmin4/pgadmin4.db

cat > /etc/apache2/sites-available/pgadmin4.conf <<EOF
<VirtualHost *:80>
    DocumentRoot /var/www/html

    WSGIDaemonProcess pgadmin processes=1 threads=25 python-home=/home/ubuntu/py35venv
    WSGIScriptAlias /pgadmin4 /home/ubuntu/py35venv/lib/python3.5/site-packages/pgadmin4/pgAdmin4.wsgi

    <Directory /home/ubuntu/py35venv/lib/python3.5/site-packages/pgadmin4/>
        WSGIProcessGroup pgadmin
        WSGIApplicationGroup %{GLOBAL}
        Require all granted
    </Directory>
</VirtualHost>
EOF

a2dissite 000-default.conf
a2ensite pgadmin4.conf
systemctl restart apache2
