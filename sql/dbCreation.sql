/*
SQL Code for the database creation. 
author: ooemperor
*/
/*
-- SCHEMA: dv
DROP SCHEMA IF EXISTS dv CASCADE;

CREATE SCHEMA IF NOT EXISTS dv AUTHORIZATION pg_database_owner;

COMMENT ON SCHEMA dv
    IS 'DataVault Schema';

GRANT USAGE ON SCHEMA dv TO PUBLIC;

GRANT ALL ON SCHEMA dv TO pg_database_owner;
*/

/*
-- SCHEMA: sec

-- DROP SCHEMA IF EXISTS sec CASCADE;

CREATE SCHEMA IF NOT EXISTS sec
    AUTHORIZATION postgres;
*/
DROP TABLE IF EXISTS dv.specs;
DROP TABLE IF EXISTS dv.nozzle;
DROP TABLE IF EXISTS dv.extruder;
DROP TABLE IF EXISTS dv.filament;
DROP TABLE IF EXISTS dv.plate;
DROP TABLE IF EXISTS dv.printer;
DROP TABLE IF EXISTS dv.manufacturer;
DROP TABLE IF EXISTS sec.user;

CREATE TABLE sec.user (
    user_sk SERIAL PRIMARY KEY, 
    load_DTS TIMESTAMPTZ DEFAULT NOW()::timestamp,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    username VARCHAR(32) NOT NULL,
    mail VARCHAR(128) NOT NULL, 
    administrator BOOLEAN DEFAULT FALSE,
    password VARCHAR(256) NOT NULL
);

CREATE TABLE dv.manufacturer (
    manufacturer_sk SERIAL PRIMARY KEY, 
    load_DTS TIMESTAMPTZ DEFAULT NOW()::timestamp,
    update_DTS TIMESTAMPTZ DEFAULT NULL,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    name VARCHAR(128) NOT NULL, 
    url VARCHAR(256) NOT NULL
);

CREATE TABLE dv.printer (
    printer_sk SERIAL PRIMARY KEY, 
    load_DTS TIMESTAMPTZ DEFAULT NOW()::timestamp,
    update_DTS TIMESTAMPTZ DEFAULT NULL,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    name VARCHAR(128),
    manufacturer_sk INT,
    description VARCHAR(512), 
    url VARCHAR(256) NOT NULL,
    FOREIGN KEY (manufacturer_sk) REFERENCES dv.manufacturer (manufacturer_sk)
);


CREATE TABLE dv.plate (
    plate_sk SERIAL PRIMARY KEY, 
    load_DTS TIMESTAMPTZ DEFAULT NOW()::timestamp,
    update_DTS TIMESTAMPTZ DEFAULT NULL,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    material VARCHAR(64) NOT NULL
);

CREATE TABLE dv.filament (
    filament_sk SERIAL PRIMARY KEY, 
    load_DTS TIMESTAMPTZ DEFAULT NOW()::timestamp,
    update_DTS TIMESTAMPTZ DEFAULT NULL,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    manufacturer_sk INT,
    color VARCHAR(64) NOT NULL,
    temp_min_extruder INTEGER,
    temp_max_extruder INTEGER,
    temp_min_bed INTEGER,
    temp_max_bed INTEGER,
    diameter DECIMAL, 
    url VARCHAR(256), 
    FOREIGN KEY (manufacturer_sk) REFERENCES dv.manufacturer (manufacturer_sk)
);

CREATE TABLE dv.extruder (
    extruder_sk SERIAL PRIMARY KEY, 
    load_DTS TIMESTAMPTZ DEFAULT NOW()::timestamp,
    update_DTS TIMESTAMPTZ DEFAULT NULL,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    type VARCHAR(128) NOT NULL
);

CREATE TABLE dv.nozzle (
    nozzle_sk SERIAL PRIMARY KEY, 
    load_DTS TIMESTAMPTZ DEFAULT NOW()::timestamp,
    update_DTS TIMESTAMPTZ DEFAULT NULL,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    material VARCHAR(128) NOT NULL 
);

CREATE TABLE dv.specs (
    specs_sk SERIAL PRIMARY KEY, 
    load_DTS TIMESTAMPTZ DEFAULT NOW()::timestamp,
    update_DTS TIMESTAMPTZ DEFAULT NULL,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    printer_sk INT,
    extruder_sk INT,
    plate_sk INT,
    filament_sk INT,
    temp_hotend INTEGER,
    temp_bed INTEGER, 
    speed_out INTEGER, 
    speed_in INTEGER,
    cooling INTEGER, 
    z_jump DECIMAL,
    extrude_speed INTEGER,
    speed_first_layer INTEGER,
    temp_hotend_first_layer INTEGER,
    temp_bed_first_layer INTEGER,
    nozzle_sk INT, 
    nozzle_iameter DECIMAL,
    FOREIGN KEY (printer_sk) REFERENCES dv.printer (printer_sk),
    FOREIGN KEY (extruder_sk) REFERENCES dv.extruder (extruder_sk),
    FOREIGN KEY (plate_sk) REFERENCES dv.plate (plate_sk),
    FOREIGN KEY (filament_sk) REFERENCES dv.filament (filament_sk)
);