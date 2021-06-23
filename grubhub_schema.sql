drop table if exists users cascade;
drop table if exists menu_items cascade;
drop table if exists orders cascade;
drop table if exists addresses cascade;
drop table if exists restaurants cascade;

create table users (
    id serial primary key,
    first_name varchar(32) NOT NULL,
    last_name varchar(32) NOT NULL,
    email varchar(64) NOT NULL,
    phone varchar(10) NOT NULL,
    address_id int
);

create table addresses (
    id serial primary key,
    street varchar(64) NOT NULL,
    city varchar(32) NOT NULL,
    state varchar(2) NOT NULL,
    zip varchar(16)
);

create table menu_items (
    id serial primary key,
    name varchar(32) NOT NULL,
    calories int,
    cost int NOT NULL,
    restaurant_id int
);

create table restaurants (
    id serial primary key,
    name varchar(32) NOT NULL,
    phone varchar(10) NOT NULL,
    email varchar(32),
    address_id int
);

create table orders (
    id serial primary key,
    user_id int,
    restaurant_id int,
    menu_item_id int,
    quantity int,
    cost decimal
);

ALTER TABLE users
ADD CONSTRAINT fk_users_addresses_id
FOREIGN KEY (address_id) REFERENCES addresses(id);

ALTER TABLE restaurants
ADD CONSTRAINT fk_restaurants_addresses_id
FOREIGN KEY (address_id) REFERENCES addresses(id);

ALTER TABLE menu_items
ADD CONSTRAINT fk_menu_items_restaurants_id
FOREIGN KEY (restaurant_id) REFERENCES restaurants(id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_users_id
FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_restaurants_id
FOREIGN KEY (restaurant_id) REFERENCES restaurants(id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_menu_items_id
FOREIGN KEY (menu_item_id) REFERENCES menu_items(id);

