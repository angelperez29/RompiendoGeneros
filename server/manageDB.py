from pymongo import MongoClient

# Dirección en la cual se encuentra MongoDB
MONGO_URI = "mongodb://127.0.0.1"
# Cliente con el que nos conectarems a MongoDB
client = MongoClient(MONGO_URI)
# Base de datos a utilizar
db = client["rgcb"]


def getData(col):
    # Una colección es similar a un table en mysql
    collection = db[col]
    collections = collection.find()
    return collections


def setDataEmployees(user, email, passwd, rol):
    collection = db["personal"]
    collection.insert_one(
        {
            "user": user,
            "email": email,
            "passwd": passwd,
            "rol": rol,
        }
    )