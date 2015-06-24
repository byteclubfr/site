module.exports = require("lodash/object/merge")({
  "metadata": {
    "livereload": "http://localhost:35729/livereload.js"
  },
  "plugins": {
    "metalsmith-watch": {
      "paths": {
        "${source}/**/*": true,
        "templates/**/*": "**/*.md"
      },
      "livereload": true
    },
    "metalsmith-serve": {
      "port": 8000,
      "verbose": true
    }
  }
}, require("./build.js"));
