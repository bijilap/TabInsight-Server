sudo apt-get update
sudo apt-get -y install python-pip python-dev nginx


## Install virtual environment
sudo pip install virtualenv

## Create directory
sudo mkdir -p /opt/tabinsight
sudo chmod -R 755 /opt/tabinsight
sudo virtualenv /opt/tabinsight/tabinsight-env
source tabinsight-env/bin/activate

## Install flask and uwsgi
sudo pip install uwsgi flask
deactivate

## Move tabinsight application to the correct folder
sudo cp -r tabinsight-app/tabinsight.py /opt/tabinsight/
sudo cp -r tabinsight-app/tabinsight.ini /opt/tabinsight/
sudo cp -r tabinsight-app/wsgi.py /opt/tabinsight/
sudo cp -r tabinsight-app/tabinsight.conf /etc/init/
sudo cp -r tabinsight-app/tabinsight /etc/nginx/sites-available/

sudo ln -s /etc/nginx/sites-available/tabinsight /etc/nginx/sites-enabled

# Create dirs
sudo mkdir -p /var/tabinsight
sudo mkdir -p /var/tabinsight/data

# Install elasticsearhc curator
sudo pip install elasticsearch-curator

# Create crontab
sudo crontab crontab.txt

#Restart Ngnix service
sudo service nginx restart
