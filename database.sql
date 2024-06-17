-- USER is a reserved keyword with Postgres
-- You must use double quotes in every query that user is in:
-- ex. SELECT * FROM "user";
-- Otherwise you will have errors!
-- USER 
CREATE TABLE "user" (
    "id" SERIAL PRIMARY KEY,
    "password" VARCHAR (1000) NOT NULL,
    "email" VARCHAR (80),
    "first_name" VARCHAR (80),
    "last_name" VARCHAR (80),
    "location" VARCHAR (80)
);
-- Pratice User Data
INSERT INTO "user" ("password", "email", "first_name", "last_name", "location")
    VALUES  ('Mewrowrouh?', 'kingofthecastle@tails.com', 'Bacon', 'Douang', 'Minneapolis'),
            ('Woof!', 'babydog20@paws.com', 'Mozzarella', 'Clendenen', 'NE MPLS'),
            ('PizzaRULEZ', 'teenagemutantninja@turtles.com', 'Donatello', 'Leonardo', 'New York City'),
            ('YinDynasty', 'ZhouDynasty@roots.com', 'Bonsai', 'Taproot', 'Tokyo, Japan'),
            ('LetsGrowww', 'GrowThroughWhatYouGoThrough@gmail.com', 'Leia', 'Monne', 'South Minneapolis');

-- CATAGORIES
CREATE TABLE "catagories" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR
);
-- Pratice Catagories
INSERT INTO "catagories" ("name")
    VALUES  ('Appliance'),
            ('HVAC'),
            ('Plumbing'),
            ('Structural');

-- DEVICE TYPES
CREATE TABLE "device_types" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR,
    "catagory_id" INT REFERENCES "catagories" NOT NULL
);
-- Pratice Device Types
INSERT INTO "device_types" ("name", "catagory_id")
    VALUES  ('Fridge', '1'), 
            ('Furnace', '2'),
            ('Under-Sink', '3'),
            ('Gutters-n-Spouts', '4');

-- DEVICE / INTAKE TABLE 
CREATE TABLE "devices" (
    "id" SERIAL PRIMARY KEY,
    "device_types_id" INT REFERENCES "device_types" NOT NULL,
    "brand" VARCHAR,
    "model" VARCHAR,
    "serial_number" VARCHAR,
    "maintenance_date" VARCHAR,
    "maintenance_due" VARCHAR,
    "location" VARCHAR,
    "img_url" VARCHAR,
    "manufacture_date" VARCHAR,
    "install_date" VARCHAR,
    "user_id" INT REFERENCES "user" NOT NULL
);
-- Pratice Device Data
INSERT INTO "devices" ("device_types_id", "brand", "model", "serial_number", "maintenance_date", "maintenance_due", "location", "img_url", "manufacture_date", "install_date", "user_id" ) 
    VALUES ('1', 'LG', 'LFX25950', 'LFX25950-123456', '2024-06-14', '2025-06-14', 'Kitchen', 'https://static-data2.manualslib.com/product-images/07a/2038183/lg-lupxc2386n-refrigerator.jpg', '2018-01-15', '2018-01-20', '3'),
           ('1', 'Kenmore', '71063', '71063-123456', '2024-05-20', '2025-05-20', 'Kitchen', 'data:image/jpeg;base64,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', '2010-04-10', '2010-04-20"', '4'),
           ('2', 'Trane', 'S9V2B040D3PSCA', 'JHY1234-4321', '2024-06-10', '2025-06-01', 'laundry Room', 'data:image/jpeg;base64,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', '2008-01-01', '2009-01-10', '3'),
           ('3', 'Delta', 'Lorelai', '95B932-32S', '07-17-2024', '07-17-2025', 'Kitchen', 'data:image/webp;base64,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', '08/08/2017', '09/09/2019', '4' );  
-- DEVICE_PROPERTIES
CREATE TABLE "device_properties" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR,
    "device_type_id" INT REFERENCES "device_types" NOT NULL
);

-- Pratice Device Properties
INSERT INTO "device_properties" ("name", "device_type_id")
    VALUES  ('Water Filter Model Number', '1'), 
            ('Air Filter Model Number', '1'),
            ('Merv Rating Desired', '1'), 
            ('Filter Type', '2'), 
            ('Filter Size', '2'),
            ('Filter Brand', '2'),
            ('Filter Model Number', '2'),
            ('Merv  Rating ', '2'),
            ('Filter Size', '3'),
            ('Filter Model Number ', '3');

-- ADDITIONAL DEVICE INFO
CREATE TABLE "additional_device_info" (
    "id" SERIAL PRIMARY KEY,
    "devices_id" INT REFERENCES "devices" NOT NULL,
    "properties_id" INT REFERENCES "device_properties" NOT NULL,
    "value" VARCHAR
);
-- Pratice Additional Device Info
INSERT INTO "additional_device_info" ("value", "devices_id", "properties_id")
    VALUES  ('wf5000z', '1', '1'),
            ('af5zffz', '1', '2'),
            ('18', '1' ,'3'),
            ('HEPA', '3', '4'),
            ('w30xl24xd1', '3', '5'),
            ('Sunbeam', '3' ,'6'),
            ('jk35lol124', '3', '7'),
            ('20', '3' ,'8'),
            ('w28xl26xd1', '4', '9'),
            ('20608', '4', '10');