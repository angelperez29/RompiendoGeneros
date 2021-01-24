from pymongo import MongoClient

# Dirección en la cual se encuentra MongoDB
MONGO_URI = "mongodb://127.0.0.1"
# Cliente con el que nos conectarems a MongoDB
client = MongoClient(MONGO_URI)
# Base de datos a utilizar
db = client["rgcb"]
# Una colección es similar a un table en mysql
collection = db["personal"]

"""

---Nota---
Si la base de datos o la colección no existen MongoDB la crea pero no la escribira en
el almacenamiento hasta que hagamos uso de ella
"""

# Para guardar un solo documento en la DB se hace uso de .insert_one y para guardar
# más de un documento hacemos uso de .insert_many

# Para obtener todos los documentos hacemos uso de collection.find() asiganandolo a
# alguna varianble


# for employe in personal:
#    print(employe['user'])


# Para buscar por alguna regla se hace con .find({key:valor})y si solo queremos obtener
# solo uno documento hacemos uso de .find_one({key:valor})

# Para eliminar documentos o datos que cumplan con cierta regla hacemos uso de
# .delete_many() si solo queremos eliminar uno entonces hacemos uso de .delete_one()

# Con el metodo .update podemos actualizar teniendo variantes como .update_one y
# .update_many

# Para ocupar .update_one() tenemos que tomar en cuenta lo siguiente el primer valor
# que recibe el valor a buscar y el segundo es al que queremos cambiar o agregar
# por ejemplo:
#
# collection.update_one({"id":12},{"set":{"id":11,"user":emiliano}})
#
# en donde el segundo argumento debe indicarse un "set" para indicar lo que queremos
# cambiar este "set" tedra asignado un diccionario con los valores que queremos
# actualizar o incluso agregar a ese documento
