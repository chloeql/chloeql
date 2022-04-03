-- Populate the database

DROP SCHEMA IF EXISTS sales;

CREATE SCHEMA sales;
SET search_path=sales;

CREATE TABLE employee
(
    id int PRIMARY KEY,
    first_name text,
    last_name text,
    position text,
    management_level int,
    has_de_permission boolean
);

INSERT INTO employee
VALUES
(31333, 'Margareta', 'Siegrist', 'Senior Vice President of Sales', 6, FALSE),
(21138, 'Jacob', 'Rivkin', 'Director of Business Analytics', 4, FALSE),
(42132, 'Johannes', 'Tischler', 'Lead Data Scientist', 0, TRUE),
(39102, 'Pratyusha', 'Gupta', 'Senior Manager of Data Engineering', 2, TRUE),
(17032, 'Alina', 'Kotova', 'Senior Data Engineer', 0, TRUE),
(50219, 'Emine', 'Arslan', 'Data Scientist', 0, FALSE),
(43138, 'Jonathan', 'Smith', 'Senior Business Analyst', 0, FALSE);

CREATE TABLE location
(
    location_number int PRIMARY KEY,
    street_address text,
    city text,
    state text,
    zipcode text,
    is_store int
);

insert into location
VALUES
(1, '258 Washington St', 'Brookline', 'MA', '02445', 1),
(23, '109 W 106th St', 'New York', 'NY', '10025', 0),
(30, '1034 S Church St', 'Monroe', 'NC', '28110', 1);

CREATE TABLE item
(
    item_number int PRIMARY KEY,
    name text,
    vendor text
);

insert into item
VALUES
(3021342, 'Minkowski Mint Chocolate', 'Minkowski'),
(5392248, 'Feline Delight Original Canned Cat Food', 'Feline Delight'),
(3489494, 'Oranges 5lb', 'Anderson Farms');

CREATE TABLE sales
(
    transaction_id int PRIMARY KEY,
    item_number int,
    location_number int,
    transaction_timestamp int,
    item_quantity int
);

insert into sales
VALUES
(1, 3021342, 1, 1641740123, 2),
(2, 5392248, 30, 1641741003, 4),
(3, 3021342, 1, 1641742093, 3);
