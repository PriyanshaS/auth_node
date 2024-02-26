# Auth using nodejs with flutter frontend

## Introduction
This application is a modern solution for implementing authentication processes using JSON Web Tokens (JWT). It utilizes Node.js for the backend server hosted on Render, Flutter for the frontend development, and MongoDB for database management. With this app, users can securely authenticate and access various features while their sessions are managed through JWT tokens.

## Features
User Authentication: Users can sign up, log in, and log out securely.<br>
JWT Token-based Authentication: Authentication is managed through JWT tokens, ensuring secure communication between the frontend and backend.<br>
Secure Password Storage: Passwords are securely hashed and stored in the MongoDB database.<br>
Token Refresh: Implement token refresh mechanism to enhance security and user experience.<br>
Authorization Middleware: Protect routes and endpoints to ensure only authenticated users can access certain features.<br>
Error Handling: Comprehensive error handling to provide meaningful feedback to users during authentication processes.<br>
Responsive User Interface: The frontend is built using Flutter, ensuring a smooth and responsive user experience across different devices.<br>

## App Preview
<img src="https://raw.githubusercontent.com/PriyanshaS/node_auth/master/img/login.jpeg" width="150" height="280"> <img src="https://raw.githubusercontent.com/PriyanshaS/node_auth/master/img/signup.jpeg" width="150" height="280">
<img src="https://raw.githubusercontent.com/PriyanshaS/node_auth/master/img/home.jpeg" width="150" height="280">

## Getting Started
To get started with this application, follow these steps:<br>

Clone the Repository: Clone the repository to your local machine.<br>
Install Dependencies: Navigate to the backend and frontend directories and install dependencies using npm and Flutter package manager respectively.<br>
Database Configuration: Set up MongoDB and configure the connection string in the backend.<br>
JWT Secret Key: Generate a secret key for JWT token signing and update the configuration in the backend.<br>
Run Backend Server: Start the Node.js server on Render or locally.<br>
Launch Frontend: Run the Flutter application on an emulator or a physical device.<br>

## Technology Used
Backend: Node.js<br>
Frontend: Flutter<br>
Database: MongoDB<br>
Authentication: JWT Tokens<br>
Hosting: Render (for backend)<br>

This application combines the power of Node.js, Flutter, and MongoDB to provide a secure and efficient authentication process using JWT tokens.
