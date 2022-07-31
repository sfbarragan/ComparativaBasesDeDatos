import csv
import pandas as pd
from sqlalchemy import create_engine, types
import MySQLdb


#Insert de Customers

mydb = MySQLdb.connect(host='localhost',
        user='root',
        passwd='',
        db='Northwind')
 
with open ('UData Customers.csv') as csv_file:
    csvfile = csv.reader(csv_file, delimiter=',')
    all_values = []
    for row in csvfile:
        values = (row[0],row[1],row[2],row[3], row[4],row[5],row[6],row[7], row[8],row[9],row[10])
        all_values.append(values)
        
query = "UPDATE Customers SET CompanyName = %s , ContactName = %s, ContactTitle = %s, Address = %s, City = %s, Region = %s, PostalCode = %s, Country = %s, Phone = %s, Fax = %s WHERE CustomerID = %s"
mycursor = mydb.cursor()
mycursor.executemany(query, all_values)
mydb.commit()
