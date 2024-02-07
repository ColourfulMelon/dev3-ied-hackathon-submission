# Project Documentation
## Overview
This project is a web application built using TypeScript, JavaScript, Node.js, and npm. It uses the Svelte framework for the frontend and the Dfinity Internet Computer for the backend. The project is structured into a frontend and a backend, each with its own source code and configuration files.  
## Frontend
The frontend is written in Svelte and TypeScript. The entry point of the frontend is src/hello_frontend/index.html. The frontend code is located in the src/hello_frontend/src directory. The main file is login.svelte, which contains the login functionality of the application.  The frontend uses webpack for bundling the application. The configuration for webpack is located in webpack.config.js. This file contains settings for the development and production environments, module rules, plugins, and dev server settings.  The HtmlWebpackPlugin is used to generate an HTML file that includes all webpack bundles in the script tags. The template for this HTML file is specified in the frontend_entry variable.  

Some frontend development history can be found at [frontend.](https://github.com/ColourfulMelon/hackathon-frontend)
## Backend
The backend is written in Motoko and is defined in the dfx.json file. The main file for the backend is src/hello_backend/main.mo. The backend interacts with the Internet Identity service, which is specified in the dfx.json file.  
## Building and Running the Project
To build the project, use the npm run build command. This will compile the TypeScript and Svelte code into JavaScript, bundle the frontend using webpack, and build the backend using the Dfinity SDK.  To run the project, use the npm start command. This will start the webpack dev server, which serves the frontend, and the Dfinity local network, which runs the backend.  
## Running the project locally
To run the project locally, you will need to have DFX installed (> v0.12). You can find instructions for that [here.](https://sdk.dfinity.org/docs/quickstart/local-quickstart.html)
```bash
# Starts the replica, running in the background
dfx start --background

# Deploys your canisters to the replica and generates your candid interface
dfx deploy
```
Once the job completes, your application will be available at `http://localhost:4943?canisterId={asset_canister_id}`.
## Environment Variables
Environment variables are used to configure the application. These are loaded from a .env file at the root of the project using the dotenv package. The environment variables include the Dfinity network settings and the canister IDs for the backend and the Internet Identity service.  
TypeScript Configuration
The TypeScript configuration is located in src/hello_frontend/tsconfig.json. This file extends the base configuration provided by the @tsconfig/svelte/tsconfig.json package and includes additional settings for the project.  
## Styles
The styles for the application are written in CSS and are included in the Svelte components. The styles for the login button, for example, are located in the login.svelte file.  
## Assets
The assets for the frontend, such as images, are located in the src/hello_frontend/assets directory. These are copied to the dist/hello_frontend directory during the build process using the CopyWebpackPlugin.  
## Proxy
During development, requests to /api are proxied to http://127.0.0.1:4943 using the webpack dev server's proxy feature. This allows the frontend to communicate with the backend running on the local network.