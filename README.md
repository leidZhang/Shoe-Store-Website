# Introduction
This is the course project for EECS4413, is an e-commerce website utilizing React, Django and MySQL database. It provides several functions such as product display, shopping cart and order viewing.
# Features
- User management: This module is responsible for viewing, modifying, creating, deleting, and disabling users.
- Cart: This module is responsible for processing the user's shopping cart content. Users can modify the quantity or delete the product on the cart page.
- Checkout: This module is responsible for processing the payment method, shipping address, and completing the submission and confirmation of orders.
- Product Information Management: This module is responsible for storing and managing various data of products, such as names, prices, classifications, descriptions, images, inventory, etc., as well as providing search, filtering, sorting, and other functions for products.
- Order Management: This module is responsible for tracking and processing the user's order status, such as processing, delivered, canceled, etc.
# Installation and Usage
To install and run this project on your local machine, you need to have Python and Node.js on your computer.
To install the other required packages, navigate to the project directory and then run `python3 -m pip install -r requirements.txt`

Then, follow these steps:
1. Clone this repository to your machine, you can use the following command:
`git clone https://github.com/leidZhang/EECS4413Project.git`
2. Go to ereact folder to start the frontend:
```
cd ereact
npm start
```
3. Open another console, go to edjango folder to start the backend:
```
cd edjango
python manage.py runserver
```
4. Once the frontend and the backend are running, you can enjoy this project.<br>
front-end url: `http://localhost:3000/`<br>
back-end url: `http://localhost:8000/`<br>

To use the django administration `http://localhost:8000/admin`, you need to log in with a username and password. You can use the following: <br>
<b>Username:</b> admin <br>
<b>Password:</b> 000000 <br>
Alternatively, you can create your own supperuser with the command `python manage.py createsupperuser`<br>

<b>Note</b>:
1. Before the first time starting the React frontend, the follow command have to be run on the console to install the dependencies:
```
cd ereact
npm install
```
2. Before the first time starting the Django backend, the following steps have to be done:<br>
i. Create a new schema called ecommerce<br>
ii. Go to edjango folder and migrate the model with `python manage.py makemigrations` and `python manage.py migrate`<br>
iii. Import data from the `ecommerce.sql` in the sql folder<br>
# API Endpoints:
<b>Base URL:</b> `http://localhost:8000`<br><br>
Login: `/auth/token/login`<br>
Logout: `/auth/token/logout`<br>
Customer Register: `/auth/users/`<br>
Customer Information: `/api/identity/user-info`<br>
Products (pagination): `/api/data-access/products`<br>
Products (full list): `/api/data-access/products/all`<br>
Product Detail: `/api/data-access/products/:id`<br>
Brands: `/api/data-access/brands`<br>
Category: `/api/data-access/categories`<br>
Order History: `/api/ordering/orders`<br>
Order Detail" `/api/ordering/orders/:id`<br>
Order Items: `/api/ordering/orders/:id/items`<br>
Cart: `/api/shopping-cart/cart`<br>
Cart Items: `/api/shopping-cart/cart/items`<br>
Cart Item (Specific item): `/api/shopping-cart/cart/items/:id`<br>
Inventory List： `/api/catalog/inventory`<br>
Inventory (Specific inventory): `/api/catalog/inventory/:id`<br>
## Project Preview
### Login 
<img src="/images/login.png" />

### Cart 
<img src="/images/cart.png" />

### Item List 
<img src="/images/catalog items.png" />

### Order Placement 
<img src="/images/purchase.png" />

## License
This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
