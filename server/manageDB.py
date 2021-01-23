from pymongo import MongoClient

# URL con la que hacemos la conexión con MongoDB
MONGO_URI = "mongodb://127.0.0.1"
# Cliente con el que nos conectaremos con MongoDB
client = MongoClient(MONGO_URI)
# Base de datos a utilizar
db = client["rgcb"]
# Definimos la colección de empleados
collectionEmployees = db["employees"]
# Definimos la colección de productos
collectionProducts = db["products"]
# Definimos la colección de clientes
collectionClients = db["clients"]
# Definimos la colección de ordenes
collectionOrders = db["orders"]


# APARTADO GENERAL
# Retornamos los documentos asociados a la colección solicitada
def getData(col):
    # Una colección es similar a un table en mysql
    collection = db[col]
    documents = collection.find()
    return documents


# APARTADO PARA EMPELADOS
# Función para guardar nuevos empleados en la DB
def setDataEmployees(name, user ,email, passwd, rol):
    collectionEmployees.insert_one(
        {
            "_id":user,
            "name":name,
            "user": user,
            "email": email,
            "passwd": passwd,
            "rol": rol,

        }
    )


# Función para bucar un solo documento de empleados
def findEmployee(user, email):
    document = collectionEmployes.find_one(
        {
            "user": user,
            "email": email,
        }
    )
    return document


# Función para actualizar los datos de los empleados
def updateEmployees(id, user, email, passwd, rol, status):
    collectionEmployes.update_one(
        {
            "_id": id,
        },
        {
            "set": {
                "_id": id,
                "user": user,
                "email": email,
                "passwd": passwd,
                "rol": rol,
                "status":staus,
            }
        },
    )


# APARTADO PARA PRODUCTOS
# Función para almacenar nuevos documentos dentro de las colección de productos
# esta función recibe como parametros el nombre del producto y la categoria
def setDataProduct(product, categorie):
    collectionProducts.insert_one(
        {
            "produtc": product,
            "categorie": categorie,
        }
    )


# Función para buscar algún producto dentro de la colección de productos
# esta recibe como parametros el nombre y la categoria
def findProduct(product, categorie):
    collectionProducts.find_one(
        {
            "product": product,
            "categorie": categorie,
        }
    )


# Funcíon para actualizar informacioón de los productos esta recibe como
# parametro el id del producto a actualizar ademas del nombre del producto
# y la categoria
def updateProduct(id, product, categorie):
    collectionProducts.update_one(
        {
            "_id": id,
        },
        {
            "set": {
                "_id": id,
                "product": product,
                "categorie": categorie,
            }
        },
    )


# APARTADO DE CLIENTES
# Función para insertar nuevos clientes a la colección
def insertClient(name, table, hourStart, hourEnd, waiters):
    collectionClients.insert_one(
        {
            "name": name,
            "table": table,
            "hourStart": hourStart,
            "hourEnd": hourEnd,
            "waiters": waiters,
        },
    )


# Función para buscar un cliente
def findClient(name, table):
    collectionClients.find_one(
        {
            "name": name,
            "table": table,
        }
    )
