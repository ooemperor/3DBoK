--SQL Code for the database creation
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

DROP TABLE IF EXISTS sec.password;
DROP TABLE IF EXISTS 3dBok.user;

CREATE TABLE 3dBok.user (
    pkey SERIAL PRIMARY KEY, 
    load_DTS TIMESTAMPTZ DEFAULT NOW()::timestamp,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    username VARCHAR(32) NOT NULL,
    mail VARCHAR(128) NOT NULL
);

CREATE TABLE sec.password (
    pkey SERIAL PRIMARY KEY, 
    load_DTS IMESTAMPTZ DEFAULT NOW()::timestamp,
    user_pkey INT,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    password VARCHAR(128) NOT NULL, 
    FOREIGN KEY (user_pkey) REFERENCES 3dBok.user(pkey)
);

CREATE TABLE manufacturer (
    pkey SERIAL PRIMARY KEY, 
    load_DTS IMESTAMPTZ DEFAULT NOW()::timestamp,
    update_DTS TIMESTAMPTZ DEFAULT NULL,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    --TODO
);

CREATE TABLE printer (
    pkey SERIAL PRIMARY KEY, 
    load_DTS IMESTAMPTZ DEFAULT NOW()::timestamp,
    update_DTS TIMESTAMPTZ DEFAULT NULL,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    type VARCHAR(64) NOT NULL, 
    manufacturer VARCHAR(64) NOT NULL, 
    description VARCHAR(512), 
    url
);

CREATE TABLE plate (
    /*
    glass, glass plated, PEI, BuildPlate, FR4
    */
    pkey SERIAL PRIMARY KEY, 
    load_DTS IMESTAMPTZ DEFAULT NOW()::timestamp,
    update_DTS TIMESTAMPTZ DEFAULT NULL,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    --TODO
);

CREATE TABLE fillament (
    pkey SERIAL PRIMARY KEY, 
    load_DTS IMESTAMPTZ DEFAULT NOW()::timestamp,
    update_DTS TIMESTAMPTZ DEFAULT NULL,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    manufacturer,
    color,
    temp_min_extruder,
    temp_max_extruder,
    temp_min_bed,
    temp_max_bed,
    diameter, 
    url
    --TODO
);

CREATE TABLE extruder (
    /*
    direct, bowden
    */
    pkey SERIAL PRIMARY KEY, 
    load_DTS IMESTAMPTZ DEFAULT NOW()::timestamp,
    update_DTS TIMESTAMPTZ DEFAULT NULL,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    --TODO
);

CREATE TABLE nozzle (
    /*
    brass, brass plated, copper plated, steel, rubin (?)
    */
    pkey SERIAL PRIMARY KEY, 
    load_DTS IMESTAMPTZ DEFAULT NOW()::timestamp,
    update_DTS TIMESTAMPTZ DEFAULT NULL,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    --TODO
);

CREATE TABLE specs (
    pkey SERIAL PRIMARY KEY, 
    load_DTS IMESTAMPTZ DEFAULT NOW()::timestamp,
    update_DTS TIMESTAMPTZ DEFAULT NULL,
    delete_DTS TIMESTAMPTZ DEFAULT NULL,
    printer_pkey,
    extruder_pkey,
    bed_pkey,
    fillament_pkey,
    temp_hotend,
    temp_bed, 
    speed_out, 
    speed_in,
    cooling, 
    z_jump,
    extrude_speed,
    speed_first_layer,
    temp_hotend_first_layer,
    temp_bed_first_layer,
    nozzle, 
    nozzle diameter
);