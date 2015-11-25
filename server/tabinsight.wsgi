import sys, os

APP_PATH = '/opt/tabinsight-app'

sys.path.insert (0, APP_PATH)
os.chdir(APP_PATH)
from srv import app as application
