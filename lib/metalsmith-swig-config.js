const swig = require('swig')
const moment = require('moment')

module.exports = function (opts) {
  swig.setFilter('date', function (input, format, lang) {
    var date = moment(input)
    date.locale(lang || opts.date.lang)
    return date.format(format || opts.date.format)
  })

  swig.setFilter('lower', (input) => input.toLowerCase())

  return function (files, metalsmith, done) {
    setImmediate(done)
  }
}
