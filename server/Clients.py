# Clase para clientes
from Connection.Principal import General


class Clients(General):

    # Metodo constructor de la clase
    def __init__(self):
        super.__init__()
        self.collectionClients = self.db["clients"]

    # Metodo para insertar nuevos clientes a la colección
    def insertClient(self, id, name, table, hourStart, hourEnd, waiters, order):
        self.collectionClients.insert_one(
            {
                "_id": id,
                "name": name,
                "table": table,
                "hourStart": hourStart,
                "hourEnd": hourEnd,
                "waiters": waiters,
                "order": order,
            },
        )

    # Metodo para buscar un cliente
    def findClient(self, id):
        self.collectionClients.find_one(
            {
                "_id": id,
            }
        )

    # Metodo para actualizar informacion del cliente
    def updateClients(self, id, name, table, waiters, order):
        self.collectionClients.udpate_one(
            {
                "_id": id,
                "set": {
                    "_id": id,
                    "name": name,
                    "table": table,
                    "waiters": waiters,
                    "order": order,
                },
            }
        )
