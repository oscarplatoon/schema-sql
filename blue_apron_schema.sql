
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
    user_id serial PRIMARY KEY,
    user_name varchar(255)   NOT NULL,
    contact_phone varchar(15)   NOT NULL,
    address_id int   NULL,
    service_plan int   NULL
);

DROP TABLE IF EXISTS addresses CASCADE;
CREATE TABLE addresses (
    address_id serial PRIMARY KEY,
    street varchar(255)   NOT NULL,
    street2 varchar(255)   NULL,
    city varchar(255)   NOT NULL,
    state varchar(20)   NOT NULL,
    zip_code varchar(10)  NOT NULL,
    country varchar(255)   NOT NULL
);

DROP TABLE IF EXISTS service_plans CASCADE;
CREATE TABLE service_plans (
    service_plan_id serial PRIMARY KEY,
    service_plan_name varchar(255)   NOT NULL,
    service_plan_price decimal(4,2)   NOT NULL,
    service_plan_promotions int   NOT NULL
);

DROP TABLE IF EXISTS recipes CASCADE;
CREATE TABLE recipes (
    recipe_id serial PRIMARY KEY,
    name varchar(40)   NOT NULL,
    description varchar(255)   NOT NULL,
    -- Add an ingredients table?
    ingredients varchar(255)   NOT NULL
);

DROP TABLE IF EXISTS promotions CASCADE;
CREATE TABLE promotions (
    promotion_id serial PRIMARY KEY,
    promotion_start_date date   NULL,
    promotion_end_date date   NULL,
    promotion_time_start time   NULL,
    promotion_time_end time   NULL,
    promotion_price decimal(4,2)   NOT NULL
);

DROP TABLE IF EXISTS deliveries CASCADE;
CREATE TABLE deliveries (
    delivery_id serial PRIMARY KEY,
    delivery_recipe int   NOT NULL,
    delivery_recipient int   NOT NULL,
    delivery_date date   NOT NULL
);

ALTER TABLE users ADD CONSTRAINT fk_users_address_id FOREIGN KEY(address_id)
REFERENCES addresses (address_id);

ALTER TABLE users ADD CONSTRAINT fk_users_service_plan FOREIGN KEY(service_plan)
REFERENCES service_plans (service_plan_id);

ALTER TABLE service_plans ADD CONSTRAINT fk_service_plans_service_plan_promotions FOREIGN KEY(service_plan_promotions)
REFERENCES promotions (promotion_id);

ALTER TABLE deliveries ADD CONSTRAINT fk_deliveries_delivery_recipe FOREIGN KEY(delivery_recipe)
REFERENCES recipes (recipe_id);

ALTER TABLE deliveries ADD CONSTRAINT fk_deliveries_delivery_recipient FOREIGN KEY(delivery_recipient)
REFERENCES users (user_id);

