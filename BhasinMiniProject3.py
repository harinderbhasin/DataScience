#! /usr/bin/python
# Author: Harry Bhasin
# Assignment: MSDS7330 Mini Project 3
# This project is done in collaboration with Peter Byrd
# MiniProject3.py

import sys
import csv
import os.path
import time
import glob
import subprocess
import re
import MySQLdb


class Database:

    host = "localhost"
    user = "root"
    password = "Welcome"
    db = "SalesOrdersExampleTest"

    def __init__(self):
        print "In init"
        self.connection = MySQLdb.connect(self.host, self.user, self.password, self.db)
        self.cursor = self.connection.cursor()
        return

    def query(self, query):
        print "In query"
        cursor = self.connection.cursor( MySQLdb.cursors.DictCursor )
        cursor.execute(query)
        return cursor.fetchall()

    def __del__(self):
        print "In del"
        self.connection.close()
        return

def main():

# Here we setup the database connection and the database to be used
        db = Database()

# Here we setup the query
        select_query = """ select distinct Customers.CustomerID, Customers.CustFirstName, Customers.CustLastName, Customers.CustStreetAddress, Customers.CustCity, Customers.CustState, Customers.CustZipCode, Customers.CustAreaCode, Customers.CustPhoneNumber from Customers, Orders, Order_Details, Products, Categories where Products.CategoryID=Categories.CategoryID AND Products.ProductNumber=Order_Details.ProductNumber AND Orders.OrderNumber=Order_Details.OrderNumber AND Customers.CustomerID=Orders.CustomerID AND Categories.CategoryDescription!='Bikes' AND Categories.CategoryDescription!='Tires'"""

# This method executes the queries
        all_records = db.query(select_query)

        print "Answer 1.1"
        for arecord in all_records:
            print "record %s" % arecord

# Here we setup the query
        select_query = """ select distinct Customers.CustomerID, Customers.CustFirstName, Customers.CustLastName, Customers.CustStreetAddress, Customers.CustCity, Customers.CustState, Customers.CustZipCode, Customers.CustAreaCode, Customers.CustPhoneNumber from Customers, Orders, Order_Details, Products, Categories where Products.CategoryID=Categories.CategoryID AND Products.ProductNumber=Order_Details.ProductNumber AND Orders.OrderNumber=Order_Details.OrderNumber AND Customers.CustomerID=Orders.CustomerID AND Categories.CategoryDescription='Bikes' AND Products.ProductName!='% Helmet' """

# This method executes the queries
        all_records = db.query(select_query)

        print "Answer 1.2"
        for arecord in all_records:
            print "record %s" % arecord

# Here we setup the query
        select_query = """ select distinct Orders.OrderNumber, Orders.OrderDate, Orders.ShipDate, Orders.CustomerID, Orders.EmployeeID from Customers, Orders, Order_Details, Products, Categories where Products.CategoryID=Categories.CategoryID AND Products.ProductNumber=Order_Details.ProductNumber AND Orders.OrderNumber=Order_Details.OrderNumber AND Customers.CustomerID=Orders.CustomerID AND Categories.CategoryDescription='Bikes' AND Products.ProductName!='% Helmet'; """

# This method executes the queries
        all_records = db.query(select_query)

        print "Answer 1.3"
        for arecord in all_records:
            print "record %s" % arecord

# Here we setup the query
        select_query = """ select Customers.CustomerID, Customers.CustFirstName, Customers.CustLastName, Orders.OrderNumber, Orders.OrderDate, Orders.ShipDate, Orders.CustomerID, Orders.EmployeeID from Customers, Orders, Order_Details, Products, Categories where Products.CategoryID=Categories.CategoryID AND Products.ProductNumber=Order_Details.ProductNumber AND Orders.OrderNumber=Order_Details.OrderNumber AND Customers.CustomerID=Orders.CustomerID AND Products.ProductName='% Bike' AND Products.ProductName='% Helmet'; """
# This method executes the queries
        all_records = db.query(select_query)

        print "Answer 1.4"
        for arecord in all_records:
            print "record %s" % arecord

# Here we setup the query
        select_query = """ select distinct Vendors.VendorID, Vendors.VendName, Vendors.VendStreetAddress, Vendors.VendCity, Vendors.VendState, Vendors.VendZipCode, Vendors.VendPhoneNumber, Vendors.VendFaxNumber, Vendors.VendWebPage, Vendors.VendEMailAddress from Vendors, Product_Vendors, Products, Categories where Products.CategoryID=1 OR Products.CategoryID=3 OR Products.CategoryID=5; """

# This method executes the queries
        all_records = db.query(select_query)

        print "Answer 1.5"
        for arecord in all_records:
            print "record %s" % arecord

'''
time.ctime(os.path.getmtime(filename))
'''

if __name__ == '__main__':
    main()
