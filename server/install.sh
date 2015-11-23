sudo apt-get update
apt-get -y install python-pip


## Install virtual environment
sudo pip install virtualenv

## Create directory
#mkdir tabinsight-app
cd tabinsight-app
virtualenv venv
sudo chmod -R 755
. venv/bin/activate

## Install flask
sudo pip install Flask

# Create dirs
mkdir /var/tabinsight
mkdir /var/tabinsight/data

# Install elasticsearhc curator
sudo pip install elasticsearch-curator

# Create crontab
sudo crontab crontab.txt
