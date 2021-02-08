# Clase para productos
from Connection.Principal import General


class Employees(General):

    # Metodo constructor de la clase
    def __init__(self):
        super().__init__()
        # Definimos la colección de productos
        self.collectionEmployees = self.db["employees"]

    # APARTADO PARA EMPELADOS
    # Función para guardar nuevos empleados en la DB
    def setDataEmployees(self, name, user, email, passwd, rol, status):
        self.collectionEmployees.insert_one(
            {
                "_id": user,
                "name": name,
                "user": user,
                "email": email,
                "passwd": passwd,
                "rol": rol,
                "status": status,
            }
        )

    # Función para bucar un solo documento de empleados
    def findEmployee(self, id):
        document = self.collectionEmployees.find_one(
            {
                "_id": id,
            }
        )
        return document

    # Función para actualizar los datos de los empleados
    def updateEmployees(self, user, name, email, passwd, rol, status):
        filter = {
            "_id": user,
        }
        values = {
            "$set": {
                "_id": user,
                "name": name,
                "user": user,
                "email": email,
                "passwd": passwd,
                "rol": rol,
                "status": status,
            }
        }
        self.collectionEmployees.update_one(filter, values)
