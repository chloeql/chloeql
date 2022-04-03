CREATE TABLE system.user
(
    id int PRIMARY KEY,
    first_name string,
    last_name string,
    position string,
    management_level nonneg int,
    has_de_permission bool
);

CREATE DATABASE chloedb_examples;
USE DATABASE chloedb_examples;

CREATE TABLE location
(
    location_number nonneg int PRIMARY KEY,
    address address
);

CREATE TABLE item
(
    item_number nonneg int PRIMARY KEY,
    item_name string
);

CREATE TABLE sales
(
    location_number location.location_number,
    item_number item.item_number,
    sales_datetime  timestamp,
    quantity nonneg int
);


