$ = jQuery
Trace      = require "./modules/trace"
Top        = require "./page/top"
About      = require "./page/about"

module.exports =

  class PC
    constructor: ->
      @Trace      = new Trace
      @window = $(window)

      page = $("#thispage").attr("page")
      if page is "top" then @Top = new Top
      if page is "about" then @Top = new About






$ ->
  new PC()
