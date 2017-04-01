path    = require "path"
url     = require "url"
fs      = require "fs"
yaml    = require "js-yaml"


module.exports = (file) ->
  root      = "./layouts/"
  dir       = path.dirname file.path
  # relative  = path.relative dir, root
  # name      = path.relative(root, dir)


  # console.log(file)
  data =
    meta: yaml.safeLoad fs.readFileSync "./app/data/meta.yml", "utf8"
    dirname: file
    # dirname: path.relative(root, dir)
    
    name: path.basename file.path, '.jade'
    # id: name
    # root: file
    # root: url.format(urlObj)
