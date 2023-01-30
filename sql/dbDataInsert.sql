/*
SQL Script for the data insertion into the data schema specified in dbCreation.sql
author: ooemperor
*/

--manufacturer insert
INSERT INTO dv.manufacturer (name, url) VALUES (
    ("Creality", "www.creality.com"), 
    ("Anycubic", "www.anycubic.com"), 
    ("Artillery", "artillery3d.com")
);

--printer insert
INSERT INTO dv.printer (name, manufacturer_sk, url) VALUES (
    ("Ender 3-S1", (SELECT manufacturer_sk FROM dv.manufacturer WHERE name = "Creality"), "https://www.creality.com/de/products/creality-ender-3-s1-3d-drucker")
);

--plates
INSERT INTO dv.plate (material) VALUES (
    ("glass"), 
    ("glass plated"), 
    ("PEI"), 
    ("BuildPlate"), 
    ("FR4")
);

--fillament
    --TODO: Must insert some test-data for the database

--extruder
INSERT INTO dv.extruder (type) VALUES (
    ("direct drive"), 
    ("bowden drive")
);

INSERT INTO dv.nozzle (material) VALUES (
    ("brass"),
    ("brass plated"), 
    ("copper plated"),
    ("steel"),
    ("rubin")
);