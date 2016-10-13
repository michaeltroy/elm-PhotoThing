# Tiny Build Elm

Tired of dealing with a front-end mess for tiny websites or prototyping? Tiny Build Elm aims to solve that problem for small Elm apps.

Tiny Build Elm uses:

- `NPM` for required npm packages
- `elm-package` for elm packages
- `elm-make` to build our Elm files
- `Chokidar` to watch our Elm files
- `cssnext` for transpiling the css (deprecated need to update)

and __NPM to run our scripts__.


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
