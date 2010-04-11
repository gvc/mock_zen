module MockZen
  
  # A Spy is a class that records every method call for further verification.
  class MockZen::Spy
    
    # Creates the spy that will record any method calls on it.
    #   spy = Spy.new
    #   spy.called?(:method) # false
    #   spy.method
    #   spy.called?(:method) # true
    def initialize
      @methods_called = Hash.new(0)
    end
    
    # Returns true if the method has been called on the Spy.
    # <code>method_name</code> must respond to to_sym.
    def called?(method_name)
      @methods_called[method_name.to_sym] > 0 if method_name.respond_to? :to_sym
    end
    
    # Returns the number of times that <code>method_name</code> was called
    # on the spy object.
    # <code>method_name</code> must respondo to to_sym.
    def times_called(method_name)
      @methods_called[method_name.to_sym] if method_name.respond_to? :to_sym
    end
    
  private
    def method_missing(name, *args, &block)
      @methods_called[name] += 1
    end
    
  end
  
end