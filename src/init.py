from flask import Flask, render_template as render
import os

templatesDir = os.path.abspath('templates')

app = Flask("3DBoK", template_folder=templatesDir)


@app.route("/")
def home():
    return render("Home.html")


@app.route("/printers")
def printer():
    return render("Printer.html")


@app.route("/fillaments")
def fillament():
    return render("Fillament.html")


@app.route("/template")
def template():
    return render("Template.html")

def start_page():
    app.run(debug=True)


start_page()
