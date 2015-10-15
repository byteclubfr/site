const _ = require('lodash')
const url = require('url')
const swig = require('swig')

module.exports = function (opts) {
  const prefix = swig.compile(opts.prefix)
  const suffix = swig.compile(opts.suffix)

  return function (files, metalsmith, done) {
    setImmediate(done)

    _.forEach(files, (post, path) => {
      // Only if it's a blog post with metadata 'external' and 'url'
      if (_.contains(post.collection, 'posts') && post.external && post.url) {

        // This posts usually have no contents: define one from description
        const contents = String(post.contents).trim()
        const description = contents || String(post.description).trim()

        // Prepend/append predefined strings to description of those specific articles
        const info = _.merge({}, post, { host: url.parse(post.url).host })
        post.contents = new Buffer(prefix(info) + description + suffix(info))

        // Remove from general list of files (no need for a real HTML page here)
        // Note that this won't conflict with RSS or listing generation, as they use collections
        delete files[path]
      }
    })
  }
}
