# pages
require "file-loader?name=index.html!./index.html"

# icons
require "file-loader?name=favicon.ico!./favicon.ico"
# require "file-loader!./images/icons/*"
require "./images/icons/index.coffee"

# css
require "./css/app.scss"

# json
require "file-loader?name=manifest.json!./manifest.json"
# require "./manifest.json"

# js
require "./js/app.coffee"