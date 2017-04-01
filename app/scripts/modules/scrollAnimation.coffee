$ = jQuery
class ScrollAnimation
  constructor: ->

    trace "ScrollAnimation"
    @window = $(window)
    @test = 0
    @init()



  init: =>
    for e,i in $("[scrollAnimation]")
      t = $(e)
      if t.attr("status") != "end"
        directVal = t.attr("direct")
        if directVal
          property   = directVal.split(":")[0]
          value      = parseFloat(directVal.split(":")[1])

          origin = {}
          origin[property] = if $.isNumeric(parseInt(t.css(property))) then parseInt(t.css(property)) else 0
          origin["pos"]    = if t.css("position") is "absolute" then "absolute" else "relative"
          t.attr("originPos":origin[property])

          t.css("position", origin["pos"])
          t.css(property, origin[property] + value)
          

        t.css {"opacity": 0}



  scroll: =>
    st = @window.scrollTop()
    wh = @window.height()
    
    for e,i in $("[scrollAnimation]")
      t  = $(e)
      ot = t.offset().top
      adjust = if t.attr("adjust") then parseInt(t.attr("adjust")) else 300

      

      if ot < st + wh - adjust and t.attr("status") != "end" and !t.attr("notDefault")
        @tween(t)
        if t.attr("child")
          children = t.attr("child").split(",")
          for childValue in children
            child = $("."+childValue+"[scrollAnimation]")
            @tween(child)



  tween: (target)=>
    target.attr("status", "end")
    
    delay  = if target.attr("delay") then parseFloat(target.attr("delay")) else 0
    if @window.width() <= 960
      delay = if target.attr("delay_sp") then parseFloat(target.attr("delay_sp")) else delay
      
    easing = switch target.attr("easing")
      when "back" then Back.easeOut.config(1.7)

    direct = target.attr("direct")
    if direct
      direct = direct.split(":")
      switch direct[0]
        when "top"
          originPos = parseInt(target.attr("originPos"))
          TweenMax.to(target, 0.6, {"top":originPos, ease:easing, delay:delay})
        when "bottom"
          originPos = parseInt(target.attr("originPos"))
          TweenMax.to(target, 0.6, {"bottom":originPos, ease:easing, delay:delay})
        when "left"
          originPos = parseInt(target.attr("originPos"))
          TweenMax.to(target, 0.6, {"left":originPos, ease:easing, delay:delay})
        when "right"
          originPos = parseInt(target.attr("originPos"))
          TweenMax.to(target, 0.6, {"right":originPos, ease:easing, delay:delay})


    TweenMax.to(target, 0.6, {"opacity":1, ease:Power0.easeNone, delay:delay})

  reset: =>
    w = @window.width()
    size = "large"
    if w <= 960  then size = "tablet"
    if w <= 640  then size = "mobile"
    if w <= 420  then size = "mobileL"
    # if w <= 420  then size = "mobileL"
    if $("#thispage").attr("size") is size then return false
    
    $("#thispage").attr("size", size)
    $("[scrollAnimation]").removeAttr("style")


module.exports = ScrollAnimation
