module Mock
  
  class Mock::Stub
    # Creates the stub with the actions passed. The stub will respond to the keys in 
    # the hash and return the corresponding values.
    #   stub = Mock::Stub(method_call: false)
    #   stub.method_call # false
    def initialize(actions={})
      @actions = actions
    end
  
    def add_behaviour(options)
      options = Mock::parse_actions(options)
      @actions.merge! options
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