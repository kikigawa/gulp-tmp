Trace = require "../../common/scripts/modules/trace"
Ua    = require "../../common/scripts/modules/ua"

module.exports =

  class SP

    constructor: ->
      @trace = new Trace
      @Ua = new Ua
      trace "SP"
      TweenMax.set($('h1'), {rotation:-3, scale: 0.5})
      TweenMax.to($('h1'), 1, {rotation: 0, scale: 1, ease:Elastic.easeOut})

$ ->
  new SP()
