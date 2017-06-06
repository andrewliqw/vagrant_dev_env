# create python 3 virtual environment
cd /home/ubuntu && rm -rf /home/ubuntu/py35venv && python3 -mvenv --copies py35venv && /home/ubuntu/py35venv/bin/python -mpip install -U pip

# install pgadmin4
if ! [ -f /home/ubuntu/pgadmin4-1.5-py2.py3-none-any.whl ]; then
  cd /home/ubuntu && wget https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v1.5/pip/pgadmin4-1.5-py2.py3-none-any.whl
fi
/home/ubuntu/py35venv/bin/python -mpip install /home/ubuntu/pgadmin4-1.5-py2.py3-none-any.whl

# install python requirements
/home/ubuntu/py35venv/bin/python -mpip install -r /home/ubuntu/requirements.txt