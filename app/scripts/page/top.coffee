$ = jQuery

Browser      = require "../modules/browser"
ScrollAnimation = require "../modules/ScrollAnimation"


class Top
  constructor: ->

    trace "Top"
    trace "test"
    @window      = $(window)
    TweenLite.to($("h1"),1,{"opacity":0.1, ease:Power0.easeNone})
module.exports = Top
