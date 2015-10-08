module.exports = {
  "metadata": {
    "site":   "ByteClub",
    "url":    "http://byteclub.fr",
    "mailto": "contact@byteclub.fr",
    "tel":    "06 14 66 76 41"
  },
  "plugins": {
    "metalsmith-paths": {
      "property": "paths"
    },
    "metalsmith-collections": {
      // blog
      "posts": {
        "pattern": "blog/*.md",
        "sortBy": "date",
        "reverse": true,
        "limit": 15,
        // skip next prev links
        "refer": false
      }
    },
    "metalsmith-ignore": [
      // another npm task handle scss
      "css/**",
      // another npm task handle js concat and minify
      "js/**"
    ],
    "metalsmith-markdown": {
    },
    "metalsmith-templates": {
      "engine": "swig"
    },
  }
}
