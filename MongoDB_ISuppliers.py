# Importaciones necesarias
from unicodedata import category
from pymongo import MongoClient 
import time 

from bson.objectid import ObjectId

dbUrl = MongoClient('mongodb://localhost:27017/') 

cantidad = 500000

db = dbUrl['Northwind'] 


# Insert Employee
coleccion = db['Suppliers']

start = time.perf_counter()

for num in range(1, cantidad):    
    coleccion.insert_one({"SupplierID": str(num) , "CompanyName": "CompanyName" + str(num), "ContactName": "ContactName" + str(num), "ContactTitle": "ContactTitle" + str(num), "Address": "Address" + str(num), "City": "City" + str(num), "Region": "Region" + str(num), "PostalCode": "4343", "Country": "Country" + str(num), "Phone": "0964545454", "Fax": "101" ,  "HomePage": "HomePage" + str(num)})
    
end = time.perf_counter()

print(f"Tiempo transcurrido {end - start}") 
