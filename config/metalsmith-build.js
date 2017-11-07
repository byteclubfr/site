var site = {
  "title":  "ByteClub",
  "url":    "http://byteclub.fr",
};

module.exports = {
  // cleaning is explicitely handled by npm run clean
  // if clean == true, it erases js and css on watch
  "clean": false,
  "metadata": {
    "site":     site,
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
    "metalsmith-url": [
      [/\.(md|swig)$/, ".html"],
    ],
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
      },
      "planner": {
        "pattern": "planner/**"
      }
    },
    // TODO use metalsmith-collection's "metadata" option (but it did not what I expected)
    "./lib/metalsmith-collections-metadata": {
      "tags": {
        "menu": "blog",
        "banner": "ByteBlog",
        "title": "Tag"
      },
      "posts": {
        "layout": "blog.html",
        "menu": "blog",
        "banner": "ByteBlog"
      },
      "planner": {
        "layout": "void.html"
      }
    },
    "./lib/metalsmith-external-posts": {
      "prefix": "[externe 🔗 {{ host }}] ",
      "suffix": ""
    },
    "metalsmith-ignore": [
      // another npm task handle scss
      "css/**",
      // another npm task handle js concat and minify
      "js/**"
    ],
    "metalsmith-metallic": true,
    "metalsmith-in-place": true,
    "metalsmith-markdown": {
    },
    "metalsmith-layouts": {
      "engine": "swig",
      "default": "index.html",
      "pattern": "**/*.html"
    },
    "metalsmith-excerpts": true,
    "metalsmith-rss": {
      "feedOptions": {
        "title": site.title,
        "site_url": site.url
      },
      "collections": "posts"
    },
    "metalsmith-sitemap": {
      "hostname": site.url,
      "pattern": ['**/*.html', '!blog/tags/*.html', '!planner/*.html']
    },
  },
}
