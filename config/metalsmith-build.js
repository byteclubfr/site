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
    "metalsmith-tags": {
      "handle": "tags",
      "path": "blog/tags/:tag.html",
      "layout": "tags.html",
      "sortBy": "date",
      "reverse": true,
      "metadataKey": "tagged",
      "skipMetadata": false
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
      },
      "tags": {
        "pattern": "blog/tags/*.html"
      }
    },
    "./lib/metalsmith-collections-metadata": {
      "tags": {
        "menu": "blog",
        "banner": "Blog",
        "title": "Tag"
      },
      "posts": {
        "layout": "blog.html",
        "menu": "blog",
        "banner": "Blog"
      }
    },
    "metalsmith-ignore": [
      // another npm task handle scss
      "css/**",
      // another npm task handle js concat and minify
      "js/**"
    ],
    "metalsmith-metallic": true,
    "metalsmith-markdown": {
    },
    "metalsmith-layouts": {
      "engine": "swig",
      "default": "index.html"
    }
  }
}
