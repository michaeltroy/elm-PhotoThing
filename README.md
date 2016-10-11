# Tiny Build Elm

Tired of dealing with a front-end mess for tiny websites or prototyping? Tiny Build Elm aims to solve that problem.

Say hello to Tiny Build Elm:

- NPM for required npm packages
- NPM to run our scripts
- Elm make to build our Elm files
- Chokidar to watch our Elm files
- cssnext for transpiling the css (deprecated I think)

## Run the scripts

Boot: Installs packages and initial build ```npm run boot```

Boot and watch: Installs the packages, builds and then watches for changes ```npm run boot:watch```

Build: Builds the project ```npm run build```

Watch: Watches the project and rebuilds ```npm run watch```

Start: Starts the server and runs watch, in seperate terminal tabs  ```npm run start```

## Clean the slate

Wipe: Deletes the build and node_modules dirs ```npm run wipe```

Clean: Deletes just the build dir ```npm run clean```

## Server

Superstatic is a cool simple webserver that supports HTML pushState.

Start the webserver.

```superstatic -p 4000 public```

For single page apps add a ```superstatic.json``` file to the root of your project.

```
{
  "rewrites": [
    {
      "source": "**",
      "destination": "/index.html"
    }
  ]
}
```
