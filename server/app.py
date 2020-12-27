# Librerias necesarias para wl web service
from flask import Flask, render_template, Response, request

# Modulo en donde realizamos las peticiones a MongoDB
from manageDB import getData, setDataEmployees

# Libreria para parsear de bson (formato de MongoDB) a json
from bson import json_util

app = Flask(__name__)

# Ruta principal
@app.route("/")
def index():
    return render_template("index.html")


@app.route("/admin")
def admin():
    return render_template("admin.html")


# Rutas para obtener todos empleados o productos
@app.route("/getEmployees/<categorie>", methods=["GET"])
def getEmployees(categorie):
    categorie.lower()
    colls = getData(categorie)
    data = json_util.dumps(colls)
    return Response(data, mimetype="application/json")


# RUTAS PARA EMPLEADOS

# Ruta para agregar empleados
# De una petición POST se obtiene un JSON el que contiene
# al user, email, password y rol del empleado dentro del
# local los cuales serán almacenados en un documento dentro
# de la colección llamada personal
@app.route("/addEmployes", methods=["POST"])
def addEmployees():
    # Datos recibidos desde post
    user = request.json["user"]
    mail = request.json["mail"]
    passwd = request.json["passwd"]
    rol = request.json["rol"]
    setDataEmployees(user, mail, passwd, rol)
    return "Hecho "


# En caso de que el admin tenga un error al momento de
# agregar un nuevo empleado, este podrá realizar los cambios
# por medio de esta ruta
@app.route("/updateEmployees", methods=["POST"])
def updateEmployees():
    pass


@app.route("/employeeResigns", methods=["POST"])
def method_name():
    pass
