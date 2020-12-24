from flask import Flask, render_template
from flask_pymongo import PyMongo as pm

app = Flask(__name__)
app.config["MONGO_URI"] = "mongodb://localhost/rgcb"
pm(app)


@app.route("/addUser")
def addUser():
    return render_template("index.html")


@app.route("/personal", methods=["GET"])
def personal():
    pass
