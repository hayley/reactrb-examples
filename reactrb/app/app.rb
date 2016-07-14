require 'opal'
require 'browser/interval'
require 'jquery'
require 'opal-jquery'
require 'json'
require 'react-latest'
require 'reactrb'
# require 'reactrb/auto-import'
require 'reactrb-router'

require 'router'
require 'index'
require 'basics'
require 'reuse'
require 'items'
require 'rerendering'
require 'nodes'
require 'react_api_demo'

Document.ready? do
  Element['#content'].render { App() }
end
