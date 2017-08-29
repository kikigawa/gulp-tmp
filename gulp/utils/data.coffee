path    = require "path"
url     = require "url"
fs      = require "fs"
yaml    = require "js-yaml"


module.exports = (file) ->
  filename = file.path.split("/")
  filename = filename[(filename.length - 1)]
  filename = filename.replace(".jade", "")

  getRoot = ->
    if filename is "top" then root = "./"
    else if filename.indexOf(":") is -1 then root = "../"
    else
      level = filename.split(":").length
      count = 1
      root = ""       
      while count <= level
        root = root+"../"
        count++
    return root


  getName = ->
    if filename.indexOf(":") is -1 then name = filename
    else
      name = filename.split(":")
      name = name.join(".")
    return name


  # getGnav = ->
  #   if filename.indexOf(":") is -1 then name = filename
  #   else
  #     name = filename.split(":")
  #     name = name[0]

  #   return name


  # getoOgGroup = ->
  #   if filename.indexOf(":") is -1 then group = "common"
  #   else
  #     group = filename.split(":")
  #     group = group.join(".")
  #   return group    


  data =

    meta    : yaml.safeLoad fs.readFileSync "./app/data/meta.yml", "utf8"
    root    : getRoot()
    name    : getName()
    # gnav    : getGnav()
    # ogGroup : getoOgGroup()


# module.exports = (file) ->
#   root      = "./layouts/"
#   dir       = path.dirname file.path
#   # relative  = path.relative dir, root
#   # name      = path.relative(root, dir)


#   # console.log(file)
#   data =
#     meta: yaml.safeLoad fs.readFileSync "./app/data/meta.yml", "utf8"
#     dirname: file
#     # dirname: path.relative(root, dir)
    
#     name: path.basename file.path, '.jade'
#     # id: name
#     # root: file
#     # root: url.format(urlObj)
