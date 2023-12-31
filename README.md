# User Manager 

Welcome to the User Manager App!

The User Manager App is a user management application designed to simplify user administration tasks. It empowers you to effortlessly add, update, and delete users. This repository contains both web and mobile versions of the application.

## Key Features

- Effortlessly add new users with comprehensive details.
- Seamlessly update existing user information.
- Efficiently delete users from the system.

## Screenshots

### Web Application

<p align="center">
  <img src="https://github.com/afluxmhd/user-manager/assets/93920274/4725d44b-eb87-4e3b-9d34-16aa100154f8" width="45%"  />
  <img src="https://github.com/afluxmhd/user-manager/assets/93920274/78878120-cbb2-4037-a37f-5d1cf73cf5f5" width="45%" />
</p>






### Mobile Application

<p align="center">
  <img src="https://github.com/afluxmhd/user-manager/assets/93920274/cf2b8190-dc38-4952-ab34-ad720dbb3ed5" width="24%" style="margin-right: 1%;" />
  <img src="https://github.com/afluxmhd/user-manager/assets/93920274/c50c86a6-be6c-494c-84f9-5fe328ee0671" width="24%" style="margin-right: 1%;" />
  <img src="https://github.com/afluxmhd/user-manager/assets/93920274/3145683d-72c6-46e7-9161-d29abbe5da3e" width="24%" style="margin-right: 1%;" />
  <img src="https://github.com/afluxmhd/user-manager/assets/93920274/1900bb9d-8dff-4842-8a1e-f61521c11cbf" width="24%" style="margin-right: 1%;" />
</p>







## Technologies Utilized

- Flutter for the mobile application development.
- HTML, CSS, and JavaScript for the web application development.
- Node.js,MongoDB for the Server side.

## Getting Started

To experience the User Manager App on both web and mobile, kindly follow these instructions:


### Server Configuration

To run the server successfully, you need to configure the MongoDB connection settings. Follow these steps:

1. Create a new file named config.env in the server directory.
2. Open the `config.env` file with a text editor.
3. Add your MongoDB connection string and port number:

```
PORT = 'PORT_NUMBER'
MONGO_URI = 'YOUR_MONGO_URI'
```
4. Save the `config.env` file.
5. Navigate to the server directory of the project.
```
cd server
```
6. Run the following command
```
npm install
```
7. Once the installation is complete, run the following command to start the server:
```
npm start
```

### Web Application

1. Ensure that the server is up and running on the configured port at localhost.
2. Access the web application using this link: ```http://localhost:<portNumber>```

### Mobile Application

1. Before proceeding, ensure that you have Flutter installed on your system.
2. Clone this repository to your local machine.
3. Access the `mobile` directory.
4. Execute `flutter pub get` to install the required dependencies.
5. Connect your mobile device or emulator to your machine.
6. Run `flutter run` to launch the User Manager App on your device.
