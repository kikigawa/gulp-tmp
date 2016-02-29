Browser      = require "../modules/browser"
GoogleMap    = require "../modules/googlemap"

class Top
  constructor: ->
    trace "TOP"
    @GoogleMap = new GoogleMap

module.exports = Top
