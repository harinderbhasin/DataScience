#! /usr/bin/python

# db.py
import sys
import csv
import os.path
import time
import glob
import subprocess
import re
import MySQLdb

dirs = []
files = []
records = []

class Database:

    host = "engstats.3pardata.com"
    user = "readonlyuser"
    password = "readonlypass"
    db = "stats_config"

    def __init__(self):
        print "init"
        self.connection = MySQLdb.connect(self.host, self.user, self.password, self.db)
        self.cursor = self.connection.cursor()
        return

    def __insert__(self):
        print "insert"
        try:
            self.cursor.execute(query)
            self.connection.commit()
        except:
            self.connection.rollback()
        return

    def read_this_file(self, filename):
        print "read_this_file %s" % filename
        file = open(filename, "r")
        collected = []
        recordline = ' '
        for line in file:
            newline = ' '
            print line
            line.rstrip('\n')
            print line
            recordline = recordline + line
            newline = line.split()
            for str in newline:
                if str.endswith(";"):
                    print recordline
                    recordline = ' '
        file.close()

    def do_this(self):
        print "do_this"
        return

    def query(self, query):
        print "query"
        cursor = self.connection.cursor( MySQLdb.cursors.DictCursor )
        cursor.execute(query)
#        cursor.execute("SELECT VERSION()")

        return cursor.fetchall()

    def __del__(self):
        print "del"
        self.connection.close()
        return


def main():
    if len(sys.argv) != 1:
        print "This tool finds the requested pattern for the serial number and requested file"
        raise SystemExit('Usage: %s <serial_number> <file_type> <pattern>' % sys.argv[0])
    else:
        # serno = sys.argv[1]

        db = Database()
        db.do_this()
        db.read_this_file("/home/usr/bhasin/bin/scripts/SalesOrderCreateDB.sql.txt")
        select_query = """ SELECT inserv_serial from lds where inserv_serial > '1600009' """


#        all_sn = db.query(select_query)

#        print "ser %s " % all_sn[0]
#        for sn in all_sn:
#            print "ser %s " % sn

'''
time.ctime(os.path.getmtime(filename))
'''

if __name__ == '__main__':
    main()

