# VIPERExample

An iOS+Swift 3.0 demo project for VIPER.

## Setup Mock Server Firstly

A stand in server for the mobile devices, using [RoboHydra](http://robohydra.org/)

1. Install [nvm](https://github.com/creationix/nvm)
  1. Run `curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash`
  2. Set it up for the current shell instance by running `export NVM_DIR="$HOME/.nvm"`, then `[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"`
2. Install Node 7.10.0
3. Run `nvm install v7.10.0`
4. Check it installed correctly by running `node -v`

#### Run the server on your machine

0. go to `mockserver` folder.
1. Run `npm install` to install project dependencies. You only need to do this the first time, or when dependencies change.
2. Run the server with `npm start`
3. Go to http://localhost:3000/robohydra-admin for the admin console.

## Developer setup
1. make sure your mock server has been setup and running.
3. open `FruitApp/FruitApp.xcodeproj` by Xcode.
4. Enjoy it.

## Project Description1. 
1. Try to show that how to create a simple app with VIPER architecture.
2. Demo data with a mockserver which used node & robohydra
3. showing animaions & design idea.


