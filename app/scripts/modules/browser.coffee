'use strict'

class Browser

  constructor: ->
    @isIE = false
    @isIE8 = false
    @isIE9 = false
    @isFirefox = false
    @isSafari = false
    @isChrome = false
    @isMobile = false
    @isAndroid = false
    @isiOS = false
    @isPC = false
    @init()

  init: =>
    @userAgent = navigator.userAgent.toLowerCase()
    if @userAgent.match(/msie ([\d\.]+)/) or @userAgent.match(/trident/)
      @isIE = true
      if matched = @userAgent.match(/msie ([\d\.]+)/) or @userAgent.match(/Trident/)
        version = matched[1].split('.')
        @isIE8 = (version[0] ^ 0) == 6
        @isIE8 = (version[0] ^ 0) == 7
        @isIE8 = (version[0] ^ 0) == 8
        @isIE9 = (version[0] ^ 0) == 9
        @isIE10 = (version[0] ^ 0) == 10
        @isIE11 = (version[0] ^ 0) == 11
    else if @userAgent.match('firefox')
      @isFirefox = true
    else if @userAgent.match('safari') and @userAgent.indexOf('chrome') == -1
      @isSafari = true
    else if @userAgent.match('chrome')
     @isChrome = true

    if @userAgent.search(/iphone/) != -1 or @userAgent.search(/ipad/) != -1 or @userAgent.search(/ipod/) != -1
      @isMobile = true
      @isiOS = true
    else if @userAgent.search(/android/) != -1
      @isMobile = true
      @isAndroid = true

    if !@isMobile
      @isPC = true



  redirect: (hash) =>
    if @isMobile
      location.href = location.host + '/#' + hash

module.exports = new Browser()
