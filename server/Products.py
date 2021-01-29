# Clase para productos
from Connection.Principal import General


class Products(General):

    # Metodo constructor de la clase
    def __init__(self):
        super.__init()
        # Definimos la colección de productos
        self.collectionProducts = self.db["products"]

    def getProducts(self):
        documents = self.collectionProducts.find()
        return documents

    # Metodo para almacenar nuevos documentos dentro de las colección de productos
    # este metodo recibe como parametros:
    # nombre del producto  y categoria
    def setDataProduct(self, product, categorie):
        self.collectionProducts.insert_one(
            {
                "produtc": product,
                "categorie": categorie,
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

    # Funcíon para actualizar informacioón de los productos esta recibe como
    # parametro el id del producto a actualizar ademas del nombre del producto
    # y la categoria
    def updateProduct(self, id, product, categorie):
        self.collectionProducts.update_one(
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