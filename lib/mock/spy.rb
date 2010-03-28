module Mock
  
  class Mock::Spy
    
    def initialize
      @methods_called = Hash.new(0)
    end
    
    def called?(method_name)
      @methods_called[method_name.to_sym] if method_name.respond_to? :to_sym
    end
    
  private
    def method_missing(name, *args, &block)
      @methods_called[name] += 1
    end
    
  end
  
end