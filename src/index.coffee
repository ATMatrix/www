# pages
require "file-loader?name=index.html!./index.html"
require "file-loader?name=en.html!./en.html"
require "file-loader?name=instruction.html!./instruction.html"

# icons
require "file-loader?name=favicon.ico!./favicon.ico"
# require "file-loader!./images/icons/*"

# images
require "./images/index.coffee"

# vid
require './vid/index.coffee'

# css
require "./css/app.scss"

# resource
require "file-loader?name=resource/[name].[ext]!./resource/whitepaper-0.2.1-draft.pdf"
require "file-loader?name=resource/[name].[ext]!./resource/whitepaper-v0.2.4.pdf"
require "file-loader?name=resource/[name].[ext]!./resource/whitepaper-v0.2.5.pdf"
require "file-loader?name=resource/[name].[ext]!./resource/whitepaper-v0.2.6.pdf"

require "file-loader?name=resource/[name].[ext]!./resource/whitepaper-v0.2.1-draft-en.pdf"

require "file-loader?name=resource/[name].[ext]!./resource/get-imtoken.pdf"

# json
require "file-loader?name=manifest.json!./manifest.json"
# require "./manifest.json"

# js
require './js/typewriter.js'
require "./js/app.coffee"