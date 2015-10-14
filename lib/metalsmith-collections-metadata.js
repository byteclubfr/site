const _ = require('lodash')

module.exports = function (opts) {
  return function (files, metalsmith, done) {
    const metadata = metalsmith.metadata()
    _.forEach(opts, function (additionalMetadata, collection) {
      _.forEach(files, function (file, filepath) {
        const found = _.find(metadata[collection], file)
        if (found) {
          _.merge(file, additionalMetadata);
        }
      })
    })
    done()
  }
}
