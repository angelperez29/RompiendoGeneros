from Connection.Principal import General


class Orders(General):

    # Metodo constructor de la clase Orders
    def __init__(self):
        super.__init__()
        self.collection = self.db["orders"]
