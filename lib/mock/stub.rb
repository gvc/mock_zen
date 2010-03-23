module Mock
  
  class Mock::Stub
  
    def initialize(actions)
      @actions = actions
    end
  
    def method_missing(name, *args, &block)
      raise Mock::UndefinedActionError, "Undefined action #{name}" unless @actions[name]
    
      @actions[name]
    end
  end
end