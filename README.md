# Elm in Action

A repo for playing along with the photo app example in Elm in Action.


## Run the scripts

```npm run boot``` Installs packages and initial build.

```npm run boot:watch``` Installs the packages, builds and then watches for changes

```npm run build``` Builds the project

```npm run watch``` Watches the project and rebuilds

```npm run start``` Starts the server and runs watch, in seperate terminal tabs

## Clean the slate

```npm run wipe``` Deletes the build and node_modules dirs

```npm run clean``` Deletes just the build directory

## Server

Tiny Build Elm uses Browser-sync for serving our app.

Either use:

`npm run start`

Or alternatively:

`browser-sync start --files '../public/build/*.css, ../public/build/*.js' --server '../public/`
