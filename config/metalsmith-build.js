module.exports = {
  "metadata": {
    "site": {
      "title":  "ByteClub",
      "url":    "http://byteclub.fr",
    },
    "mailto":   "contact@byteclub.fr",
    "tel":      "06 14 66 76 41"
  },
  "plugins": {
    "./lib/metalsmith-swig-config": {
      "date": {
        "lang": "fr",
        "format": "DD MMMM YYYY"
      }
    },
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
        "pattern": "blog/!(index).md",
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
    // TODO use metalsmith-collection's "metadata" option (but it did not what I expected)
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
      "default": "index.html",
      "pattern": "**/*.html"
    },
    "metalsmith-excerpts": true,
    "metalsmith-feed": {
      "collection": "posts"
    }
  }
}
