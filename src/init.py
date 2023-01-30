from flask import Flask, render_template as render, request
import os

templatesDir = os.path.abspath('templates')
app = Flask("3DBoK", template_folder=templatesDir)


@app.route("/")
def site_home():
    return render("Home.html")


@app.route("/extruders")
def site_extruder():
    return render("Extruder.html")


@app.route("/filaments")
def site_filament():
    return render("Filament.html")


@app.route("/manufacturers")
def site_manufacturer():
    return render("Manufacturer.html")


@app.route("/nozzles")
def site_nozzle():
    return render("Nozzle.html")

@app.route("/plates")
def site_plate():
    return render("Plate.html")


@app.route("/printers")
def site_printer():
    return render("Printer.html")


@app.route("/specs")
def site_spec():
    return render("Specs.html")


@app.route("/template")
def site_template():
    return render("Template.html")


def init():
    app.run(debug=True)


init()
