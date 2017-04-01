$ = jQuery

Browser      = require "../modules/browser"
ScrollAnimation = require "../modules/ScrollAnimation"


class About
  constructor: ->

    trace "About"
    trace "test"
    @window      = $(window)
    TweenLite.to($("h1"),1,{"opacity":0.1, ease:Power0.easeNone})
module.exports = About
