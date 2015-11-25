sudo apt-get update
sudo apt-get -y install python-pip python-dev nginx


## Install virtual environment
sudo pip install virtualenv

## Create directory
sudo mkdir -p /opt/tabinsight-app
sudo chmod -R 755 /opt/tabinsight-app
sudo virtualenv /opt/tabinsight-app/tabinsight-env

## Install flask and uwsgi
sudo pip install uwsgi flask

## Install Elastic Search and Logstash
sudo ../elk_installers/elk_install.sh

## Move tabinsight application to the correct folder
sudo cp -r tabinsight-app/tabinsight.py /opt/tabinsight-app/
sudo cp -r tabinsight-app/tabinsight.ini /opt/tabinsight-app/
sudo cp -r tabinsight-app/wsgi.py /opt/tabinsight-app/
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
