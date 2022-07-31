import csv
import pandas as pd
from sqlalchemy import create_engine, types
import MySQLdb


#Insert de Products

mydb = MySQLdb.connect(host='localhost',
        user='root',
        passwd='',
        db='Northwind')
 
with open ('UData Products.csv') as csv_file:
    csvfile = csv.reader(csv_file, delimiter=',')
    all_values = []
    for row in csvfile:
        values = (row[0],row[1],row[2],row[3], row[4],row[5],row[6],row[7], row[8], row[9])
        all_values.append(values)
        
query = "UPDATE Product SET ProductName = %s, SupplierID = %s, CategoryID = %s, QuantityPerUnit = %s, UnitPrice = %s, UnitsInStock = %s, UnitsOnOrder = %s, ReorderLevel = %s, Discontinued= %s WHERE ProductID = %s"
mycursor = mydb.cursor()
mycursor.executemany(query, all_values)
mydb.commit()