const _ = require('lodash')

module.exports = function (opts) {
  return function (files, metalsmith, done) {
    setImmediate(done)

    const metadata = metalsmith.metadata()
    _.forEach(opts, (additionalMetadata, collection) => _.forEach(files, (file) => {
      const found = _.find(metadata[collection], file)
      if (found) {
        _.merge(file, additionalMetadata)
      }
    }))
  }
}
