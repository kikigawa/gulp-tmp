Browser      = require "../modules/browser"
GoogleMap    = require "../modules/googlemap"

class Top
  constructor: ->
    trace "TOP"
    @GoogleMap = new GoogleMap
    TweenLite.to($("h1"), 1, {"opacity":0.2})
    for e,i in $("h1")
      trace e

module.exports = Top
