
import csv
import pandas as pd
from sqlalchemy import create_engine, types
import MySQLdb

#Insert de Employees

mydb = MySQLdb.connect(host='localhost',
        user='root',
        passwd='',
        db='Northwind')
 
with open ('UData Employees.csv') as csv_file:
    csvfile = csv.reader(csv_file, delimiter=',')
    all_values = []
    for row in csvfile:
        values = (row[0],row[1],row[2],row[3], row[4],row[5],row[6],row[7], row[8],row[9],row[10],row[11], row[12],row[13],row[14],row[15],row[16])
        all_values.append(values)
        
query = "UPDATE Employees SET LastName = %s, FirstName = %s, Title = %s, TitleOfCourtesy = %s, BirthDate = %s, HireDate = %s, Address = %s, City = %s, Region = %s, PostalCode = %s, Country = %s, HomePhone = %s, Extension = %s, Notes = %s, ReportsTo = %s WHERE EmployeeID = %s"
mycursor = mydb.cursor()
mycursor.executemany(query, all_values)
mydb.commit()