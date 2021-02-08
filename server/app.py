# Bibliotecas necesarias para wl web service
from flask import Flask, render_template, Response, request, jsonify

# Modulos en donde realizamos las peticiones a MongoDB
from Employees import Employees
from Products import Products


# Biblioteca para parsear de bson (formato de MongoDB) a json
from bson import json_util

app = Flask(__name__)
employees = Employees()
products = Products()


# Rutas para aplicativo web
@app.route("/")
def index():
    return render_template("index.html")


@app.route("/admin")
def admin():
    return render_template("admin.html")


@app.route("/validation", methods=["POST"])
def validation():
    try:
        if request.method == "POST":
            user = request.form["user"]
            passwd = request.form["passwd"]

            if user == "admin" and passwd == "Adm1n-$":
                return render_template("content.html")
            else:
                return render_template(
                    "admin.html", alert="Contraseña o usuario incorrecto"
                )
        else:
            not_found()
    except Exception:
        return not_found()


# Rutas para obtener todos empleados o productos
@app.route("/getDataDB/<categorie>", methods=["GET"])
def getDataDB(categorie):
    try:
        categorie.lower()
        colls = employees.getData(categorie)
        data = json_util.dumps(colls)
        return Response(
            data,
            status=202,
            mimetype="application/json",
        )
    except Exception:
        return not_found()


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
        return Response(
            {"message": True},
            status=202,
            mimetype="application/json",
        )
    except Exception:
        return not_found()


# En caso de que el admin tenga un error al momento de agregar un nuevo empleado, este
# podrá realizar los cambios por medio de esta ruta
@app.route("/updateEmployees", methods=["POST"])
def updateEmployees():
    try:
        # Datos recibidos desde post
        if request.method == "POST":
            name = request.json["name"]
            user = request.json["user"]
            email = request.json["email"]
            passwd = request.json["passwd"]
            rol = request.json["rol"]
            status = request.json["status"]
            employees.updateEmployees(user, name, email, passwd, rol, status)
        return Response(
            {"message": True},
            status=202,
            mimetype="application/json",
        )
    except Exception:
        return not_found()


# Rutas para productos
@app.route("/setProducts", methods=["POST"])
def setProducts():
    try:
        if request.method == "POST":
            id = request.json["id"]
            name = request.json["name"]
            categorie = request.json["categorie"]
            price = request.json["price"]
            products.setDataProduct(id, name, categorie, price)
            return Response(
                {"message": True},
                status=202,
                mimetype="application/json",
            )
    except Exception:
        return not_found()


@app.route("/updateProducts", methods=["POST"])
def updateProducts():
    try:
        if request.method == "POST":
            id = request.json["id"]
            name = request.json["name"]
            categorie = request.json["categorie"]
            price = request.json["price"]
            products.updateProduct(id, name, categorie, price)
            return Response(
                {"message": True},
                status=202,
                mimetype="application/json",
            )
    except Exception:
        return not_found()


@app.route("/deleteProducts", methods=["POST"])
def deleteProducts():
    try:
        if request.method == "POST":
            id = request.json["id"]
            products.deleteProducts(id)
            return Response(
                {"message": True},
                status=202,
                mimetype="application/json",
            )
    except Exception:
        return not_found()


@app.errorhandler(404)
def not_found():
    message = jsonify(
        {
            "message": "Resource not found" + request.url,
        }
    )
    response = Response(
        message,
        status=404,
        mimetype="application/json",
    )
    return response


if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=8000,
        debug=True,
    )
