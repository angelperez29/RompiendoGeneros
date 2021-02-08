# Clase para productos
from Connection.Principal import General


class Products(General):

    # Metodo constructor de la clase
    def __init__(self):
        super().__init__()
        # Definimos la colección de productos
        self.collectionProducts = self.db["products"]

    # Metodo para almacenar nuevos documentos dentro de las colección de productos
    # este metodo recibe como parametros:
    # nombre del producto  y categoria
    def setDataProduct(self, id, name, categorie, price):
        self.collectionProducts.insert_one(
            {
                "_id": id,
                "name": name,
                "categorie": categorie,
                "price": price,
            }
        )

    # Metodo para buscar algún producto dentro de la colección de productos
    # esta recibe como parametro el id
    def findProduct(self, id):
        self.collectionProducts.find_one(
            {
                "_id": id,
            }
        )

    # Metodo para actualizar información de los productos esta recibe como
    # parametro el id del producto a actualizar ademas del nombre del producto
    # y la categoria
    def updateProduct(self, id, product, categorie, price):
        filter = {
            "_id": id,
        }
        values = {
            "$set": {
                "_id": id,
                "product": product,
                "categorie": categorie,
                "price": price,
            }
        }
        self.collectionProducts.update_one(filter, values)

    def deleteProducts(self, id):
        filter = {
            "_id": id,
        }
        self.collectionProducts.delete_one(filter)
