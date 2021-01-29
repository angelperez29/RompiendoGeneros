from pymongo import MongoClient


class General:
    # URL con la que hacemos la conexión con MongoDB
    MONGO_URI = "mongodb://127.0.0.1"
    # Cliente con el que nos conectaremos con MongoDB
    client = MongoClient(MONGO_URI)
    # Base de datos a utilizar
    db = client["rgcb"]

    # Retornamos los documentos asociados a la colección solicitada
    def getData(self, col):
        # Una colección es similar a un table en mysql
        collection = self.db[col]
        documents = collection.find()
        return documents

    def sayHello(self):
        print("hello from General")
