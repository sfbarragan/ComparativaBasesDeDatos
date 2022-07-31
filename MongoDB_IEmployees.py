# Importaciones necesarias
from unicodedata import category
from pymongo import MongoClient 
import time 

from bson.objectid import ObjectId

dbUrl = MongoClient('mongodb://localhost:27017/') 

cantidad = 500000

db = dbUrl['Northwind'] 


# Insert Employee
coleccion = db['Employees']

start = time.perf_counter()

for num in range(1, cantidad):    
    coleccion.insert_one({"EmployeeID": str(num) , "LastName": "Apellido" + str(num), "FirstName": "Nombre" + str(num), "Title": "Title" + str(num), "TitleOfCourtesy": "Title" + str(num), "BirthDate": "2000-02-22", "HireDate": "2000-02-22", "Address": "Address" + str(num), "City": "City" + str(num), "Region": "Region" + str(num), "PostalCode": "213" , "Country": "Country" + str(num), "HomePhone": "097676567" , "Extension": "111",  "Notes": "Notes" + str(num), "ReportsTo": "1"})
    
end = time.perf_counter()

print(f"Tiempo transcurrido {end - start}") 



