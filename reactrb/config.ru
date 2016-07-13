# config.ru
require 'bundler'
Bundler.require

# see https://github.com/opal/opal/blob/master/examples/sinatra/config.ru for a
# generic example on how to add sourcemap support to an Opal-based sinatra app

opal = Opal::Server.new {|s|
  s.append_path 'app'
  s.main = 'show'
}

sprockets   = opal.sprockets
prefix      = '/assets'
maps_prefix = '/__OPAL_SOURCE_MAPS__'
maps_app    = Opal::SourceMapServer.new(sprockets, maps_prefix)

# Monkeypatch sourcemap header support into sprockets
::Opal::Sprockets::SourceMapHeaderPatch.inject!(maps_prefix)

map maps_prefix do
  run maps_app
end

map prefix do
  run sprockets
end

get '/*' do
  example = "show"
  <<-HTML
    <!doctype html>
    <html>
      <head>
        <title>Example: #{example}.rb</title>
        #{::Opal::Sprockets.javascript_include_tag('show', sprockets: sprockets, prefix: prefix, debug: true)}
      </head>
      <body>
        <div id="content"></div>
      </body>
    </html>
  HTML
end

run Sinatra::Application
