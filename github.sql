# GrubHub Online Ordering
# Restaurant
Restaurant
-   
id   PK
name string
phone string
email string
menu_id int FK - Menu.id


# User
User
-
id PK
name string
phone string
order_id int FK - Order.id


# Menu
Menu
-
id PK
food string
menu_item_id int FK - Menu_Item.id


# Menu Item
Menu_Item
-
id PK
ingredients string
cost int


# Order
Order
-
id PK
menu_item_id int FK - Menu_Item.id
cost_menu_item_id int FK - Menu_Item.cost