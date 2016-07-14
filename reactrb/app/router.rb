class App < React::Router

  # backtrace :on

  def routes
    route('/', mounts: Basics)
    # route('/') do
    #   route('basics')
    #   route('reuse')
    #   route('rerendering')
    #   route('nodes')
    #   route('api_demo')
    #   # redirect(from: "/", to: "basics")
    # end
  end

end
