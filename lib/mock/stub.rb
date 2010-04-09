module Mock
  
  # A Stub is a class that will respond with the recorded action upon method calls.
  class Mock::Stub
    # Creates the stub with the actions passed. The stub will respond to the keys in 
    # the hash and return the corresponding values.
    #   stub = Mock::Stub(method_call: false)
    #   stub.method_call # false
    def initialize(actions={})
      @actions = actions
    end
  
    # Record a new behaviour to the stub as an alternative to passing all behaviours
    # on the constructor. 
    # <br />
    # Aliased as <code><<</code>
    def add_behaviour(actions)
      @actions.merge!(Mock::parse_actions(actions))
      self
    end

private
    def method_missing(name, *args, &block)
      raise Mock::UndefinedActionError, "Undefined action #{name}" unless @actions[name]
      @actions[name]
    end
    
    alias :<< :add_behaviour
  end
  
end