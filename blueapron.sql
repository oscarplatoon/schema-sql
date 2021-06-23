users
-
id PK int
name string
password string
phone string
email string
service_plan_id

serviceplan
-
id PK int FK >- users.id
plan string
cost int
promotion_id FK - promotion.id

recipes
-
id PK int FK - deliveries.recipe_id
title string

recipe_ingredients
-
id PK int
recipe_id FK - recipes.id
ingredients_id FK - ingredients.id

ingredients
-
id PK int
name string

promotion
-
id PK int
code string
expiration_date date

deliveries
-
id pk int
recipe_id
user_id FK - users.id