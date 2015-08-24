Trace = require "../../common/scripts/modules/trace"

module.exports =

  class SP

    constructor: ->
      @trace = new Trace
      trace "SP"
      TweenMax.set($('h1'), {rotation:-3, scale: 0.5})
      TweenMax.to($('h1'), 1, {rotation: 0, scale: 1, ease:Elastic.easeOut})

$ ->
  new SP()
