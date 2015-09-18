Trace = require "./modules/trace"
Ua    = require "./modules/ua"


module.exports =

  class PC
    constructor: ->
      @Trace = new Trace
      @Ua = new Ua
      trace "PC"
      TweenMax.set($('h1'), {rotation:-3, scale: 0.5})
      TweenMax.to($('h1'), 1, {rotation: 0, scale: 1, ease:Elastic.easeOut})

$ ->
  new PC()
