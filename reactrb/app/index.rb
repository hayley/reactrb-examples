class Index < React::Component::Base
  render do
    # puts "mounted the show method"
    div do
      div do
        AppRouter::Link("basics") { "Basics" }; br
        # link(to: "reuse") { "Reusable Components" }; br
        # link(to: "rerendering") { "Rerendering Test" }; br
        # link(to: "nodes") { "Saving and using rendered nodes" }; br
        # link(to: "api_demo") { "Low Level React API" }; br
      end
    # route_handler
    end
  end
end
