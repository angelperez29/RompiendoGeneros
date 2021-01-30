# Bibliotecas necesarias para wl web service
from flask import Flask, render_template, Response, request

# Modulos en donde realizamos las peticiones a MongoDB
from Employees import Employees


# Biblioteca para parsear de bson (formato de MongoDB) a json
from bson import json_util

app = Flask(__name__)
employees = Employees()


# Ruta principal
@app.route("/")
def index():
    return render_template("index.html")


@app.route("/admin")
def admin():
    return render_template("admin.html")


# Rutas para obtener todos empleados o productos
@app.route("/getDataDB/<categorie>", methods=["GET"])
def getDataDB(categorie):
    categorie.lower()
    colls = employees.getData(categorie)
    data = json_util.dumps(colls)
    return Response(data, status=202, mimetype="application/json")


# RUTAS PARA EMPLEADOS

# Ruta para agregar empleados
# De una petición POST se obtiene un JSON el que contiene al user, email, password y rol
# del empleado dentro del local los cuales serán almacenados en un documento dentro de
# la colección llamada personal
@app.route("/addEmployees", methods=["POST"])
def addEmployees():
    # Datos recibidos desde post
    try:
        if request.method == "POST":
            name = request.json["name"]
            user = request.json["user"]
            email = request.json["email"]
            passwd = request.json["passwd"]
            rol = request.json["rol"]
            status = request.json["status"]
            employees.setDataEmployees(name, user, email, passwd, rol, status)
        return Response({"message": True}, status=202, mimetype="application/json")
    except Exception:
        return Response({"message": False}, status=303, mimetype="application/json")


# En caso de que el admin tenga un error al momento de agregar un nuevo empleado, este
# podrá realizar los cambios por medio de esta ruta
@app.route("/updateEmployees", methods=["POST"])
def updateEmployees():
    # Datos recibidos desde post
    if request.method == "POST":
        name = request.json["name"]
        user = request.json["user"]
        email = request.json["email"]
        passwd = request.json["passwd"]
        rol = request.json["rol"]
        status = request.json["status"]
        employees.updateEmployees(user, name, email, passwd, rol, status)
    return Response.status_code


if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=8000,
        debug=True,
    )
