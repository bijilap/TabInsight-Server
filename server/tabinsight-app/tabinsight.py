#!flask/bin/python
from flask import Flask, url_for
from flask import request
from flask import json
import csv

LOG_DIR = '/var/tabinsight/data/'

app = Flask(__name__)

@app.route('/')
def index():
    return "<h1 style='color:blue'>Elastic Search Service!</h1>"

@app.route('/publish/logs', methods = ['POST'])
def parse_bulk_logstash():
         csv_obj = request.get_json()
         file_name = csv_obj[0]["device"]+".csv"
         f = csv.writer(open(LOG_DIR + file_name, "wb+"))
         #f.writerow(["device", "access_time", "app_name", "use_time"])
         for csv_row in csv_obj:
             f.writerow([csv_row["device"], csv_row["access_time"],
                 csv_row["app_name"].replace(" ", "_"), csv_row["use_time"]])
         return "CSV File written! LogStash Crunching!"

@app.route('/publish/log',methods = ['POST'])
def parse_update_logstash():
         csv_obj = request.get_json()
         file_name = csv_obj["device"]+".csv"
         f = csv.writer(open(LOG_DIR + file_name, "wb+"))
         #f.writerow(["device", "access_time", "app_name", "use_time"])
         f.writerow([csv_obj["device"], csv_obj["access_time"], 
                 csv_obj["app_name"].replace(" ", "_"), csv_obj["use_time"]])
         return "CSV File written! LogStash Crunching!"

if __name__ == '__main__':
    app.run(debug=True,host= '0.0.0.0')
