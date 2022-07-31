import csv
import pandas as pd
from sqlalchemy import create_engine, types
import MySQLdb


#Insert de Products

mydb = MySQLdb.connect(host='localhost',
        user='root',
        passwd='',
        db='Northwind')
 
with open ('Data Products.csv') as csv_file:
    csvfile = csv.reader(csv_file, delimiter=',')
    all_values = []
    for row in csvfile:
        values = (row[0],row[1],row[2],row[3], row[4],row[5],row[6],row[7], row[8])
        all_values.append(values)
        
query = "INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) VALUES ( %s, %s, %s, %s, %s, %s, %s, %s, %s)"
mycursor = mydb.cursor()
mycursor.executemany(query, all_values)
mydb.commit()

