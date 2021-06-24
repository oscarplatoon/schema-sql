

DROP TABLE IF EXISTS users CASCADE;
create table users (

id                serial Primary Key,
name              varchar(255) NOT NULL,
password          varchar(255) NOT NULL,
phone             varchar(10) NOT NULL,
email             varchar(100) NOT NULL,
service_plan_id   integer
);

DROP TABLE IF EXISTS serviceplan CASCADE;
create table serviceplan (

id              serial Primary Key references users.id,
plan            varchar(255)
cost            integer
promotion_id    references promotion
);

DROP TABLE IF EXISTS recipes CASCADE;
create table recipes(

id      serial Primary Key references deliveries
title   varchar(255) NOT NULL,
);

DROP TABLE IF EXISTS recipe_ingredients CASCADE;
create table recipe_ingredients (

id              serial Primary Key
recipe_id       references recipes
ingredients_id  references ingredients
);

DROP TABLE IF EXISTS ingredients CASCADE;
create table ingredients (

id        serial Primary Key
name      varchar(255) NOT NULL,
);

DROP TABLE IF EXISTS promotion CASCADE;
create table promotion(

id                serial Primary Key
code              varchar(255) NOT NULL,
expiration_date   date NOT NULL
);

DROP TABLE IF EXISTS deliveries CASCADE;
create table deliveries (

id          serial Primary Key
recipe_id   integer references recipes
user_id     integer references users
);