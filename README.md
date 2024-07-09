# siddifurqan_task

A company project with customer and  admin details 

Lets do it 


project details::::
Create an flutter app for the following rqeuirements.

- create a database to store customers, products etc using firebase.

==============================

Customer Registration
1) Create customer registration screen. Consider following fields.
    - Customer name
    - contact number
    - email id
    - pin code (use this API to fetch city & state using pincode: http://www.postalpincode.in/Api-Details)
    - state
    - city
    - address
    - password
    - address proof document (provide an option to upload the image of address proof)
    - link to navigate to login

2) All fields are mandatory

3) Check whether entered city and pin code are present in the selected image (User should not be able to register until this condition matches).

4) Validate mobile number with firebase otp service.

5) If mobile number already registered, then do direct login and redirect to home screen.

==============================

Login
1) Create a login screen
    - Mobile number
    - password
    - link to navigate to login
2) Check user has registered or not. If not, then show message to do registration.

==============================

Admin Login
1) Create product master screen to add and edit products. Consider following fields:
    - product name
    - images
    - description
    - rate

2) Create a screen to show list of orders created by customers

3) Create a screen to show order details selected from the list and provide functionality to accept or reject the order and send notification to particular customer. Consider folloing fields for an order:
    - Customer Name
    - Shipping address
    - contact number
    - delivery date and time
    - Products list along with their quantities

==============================

Customer Login
1) Create a screen to show list of products added by admin
    - provide option to add to cart

2) Create a screen to show details of selected product
    - provide option to add to cart

3) Create a screen for products added into cart
    - provide functionality to edit the quantity for each product
    - show final amount calculated as per rate and quantity for all products
    - provide an option to go to checkout screen
    - Customer should not be able to proceed further without login

4) Create a screen to do checkout
    - Collect full shipping address, contact number, delivery date and time. Default address and contact number should be details taken at the time of registration.
    - Select payment method: Online, Pay on Delivery
    - Implement any demo payment gateway for online payment
    - place the order
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
