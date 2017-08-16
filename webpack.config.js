var path = require("path");
var webpack = require("webpack");
var ExtractTextPlugin = require("extract-text-webpack-plugin");
var Clean = require("clean-webpack-plugin");
var git = require("git-rev-sync");
var autoprefix = require("autoprefixer")

var root_dir = path.resolve(__dirname);

module.exports = function(){
  // stage variable
  var env = process.env.NODE_ENV
  console.log(env);

  // OUTPUT PATH
  var outputPath = path.join(root_dir, "assets");

  var cssLoaders = [
    { loader: "style-loader" },
    { loader: "css-loader?sourceMap" },
    { loader: "postcss-loader" }
  ];

  var scssLoaders =  [
    { loader: "style-loader" },
    { loader: "css-loader?sourceMap" },
    {
      loader: "postcss-loader",
      options: {
        plugins: [autoprefix]
      }
    },
    {
      loader: "sass-loader?sourceMap",
      options: {
        outputStyle: "expanded"
      }
    }
  ];

  // COMMON PLUGINS
  var plugins = [
    new webpack.optimize.OccurrenceOrderPlugin(),
    new webpack.DefinePlugin({
      APP_VERSION: JSON.stringify(git.tag()),
      __CDN__: JSON.stringify(env.cdn || "")
    }),
  ];

  if (env == "production") {
    var outputPath = path.join(root_dir, "dist");

    // DIRECTORY CLEANER
    var cleanDirectories = [outputPath];

    // WRAP INTO CSS FILE
    var extractCSS = new ExtractTextPlugin("css/app.css");
    cssLoaders = extractCSS.extract({
      fallback: "style-loader",
      use: [
        { loader: "css-loader?sourceMap" },
        {
          loader: "postcss-loader",
          options: {
            plugins: [autoprefix]
          }
        }
      ]
    });
    scssLoaders = extractCSS.extract({
      fallback: "style-loader",
      use: [
        { loader: "css-loader?sourceMap" },
        {
          loader: "postcss-loader",
          options: {
            plugins: [autoprefix]
          }
        },
        { loader: "sass-loader?sourceMap", options: {
          outputStyle: "expanded"}
        }
      ]
    });

    // PROD PLUGINS
    plugins.push(new Clean(cleanDirectories));
    plugins.push(new webpack.DefinePlugin({ __DEV__: false }));
    plugins.push(extractCSS);
    plugins.push(new webpack.LoaderOptionsPlugin({
      minimize: true,
      debug: false
    }));

    if (!env.noUgly) {
      plugins.push(new webpack.optimize.UglifyJsPlugin({
        sourceMap: true,
        compress: { warnings: true },
        output: { screw_ie8: true }
      }));
    }
  } else {
    // plugins.push(new webpack.optimize.OccurenceOrderPlugin());
    plugins.push(new webpack.DefinePlugin({ __DEV__: true }));
    plugins.push(new webpack.HotModuleReplacementPlugin());
    plugins.push(new webpack.NoEmitOnErrorsPlugin());
  }

  console.log("outputPath", outputPath);

  var config = {

    entry: {
      app: "./src/index.coffee",
      // vendor: ["jquery", "bootstrap"]
    },

    output: {
      publicPath: "/", //env.prod ? env.cdn : "/",
      filename: "js/[name].js",
      path: outputPath
    },

    module: {
      rules: [
        {
          test: /\.js$/,
          exclude: [/node_modules/],
          loader: "babel-loader",
          options: {compact: false, cacheDirectory: true}
        },
        { test: /\.coffee$/, loader: "coffee-loader" },
        { test: /\.(coffee\.md|litcoffee)$/, loader: "coffee-loader?literate" },
        {
          test: /\.css$/,
          loader: cssLoaders
        },
        {
          test: /\.scss$/,
          loader: scssLoaders
        },
        {
          test: /\.(png|jpg|gif)$/,
          exclude:[
            path.resolve(root_dir, "src/images/icons"),
            path.resolve(root_dir, "src/images/team")
          ],
          use: "file-loader?name=./images/[name].[ext]"
        },
        {
          test: /\.woff$/,
          use: [
            {
              loader: "url-loader",
              options: {
                limit: 100000,
                mimetype: "application/font-woff"
              }
            }
          ]
        },

        { test: /.*\.svg$/, loaders: ["svg-inline-loader", "svgo-loader"] }
      ]
    },

    plugins: plugins,

    watch: env == 'development',

    devServer: {
      inline: true //,
      // publicPath: '/',
      // hot: env == 'development'
    },
    devtool: env == 'development' ? 'eval-source-map' : 'inline-eval-cheap-source-map'
  }

  return config;
}
