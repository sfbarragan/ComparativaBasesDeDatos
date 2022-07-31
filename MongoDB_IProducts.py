# Importaciones necesarias
from unicodedata import category
from pymongo import MongoClient 
import time 

from bson.objectid import ObjectId

dbUrl = MongoClient('mongodb://localhost:27017/') 

cantidad = 500000

db = dbUrl['Northwind'] 


# Insert Employee
coleccion = db['Products']

start = time.perf_counter()

for num in range(1, cantidad):    
    coleccion.insert_one({"ProductID": str(num) , "ProductName": "ProductName" + str(num), "SupplierID": "1", "CategoryID": "1", "QuantityPerUnit": 1, "UnitPrice": 2, "UnitsInStock": 23, "UnitsOnOrder": 1323 "ReorderLevel": 5, "Discontinued": 1})
    
end = time.perf_counter()

print(f"Tiempo transcurrido {end - start}") 