require_relative 'test_helper'

class SpyTest < Test::Unit::TestCase  
  context "A spy" do

    setup do
      @spy = Mock::Spy() 
    end

    should "record if a given method is called" do
      @spy.method_call
      assert @spy.called?(:method_call)
    end
    
    should "return false if the method wasn't called at all" do
      assert not(@spy.called?(:method_call))
    end
    
    should "return 0 if the method wasn't called at all" do
      assert_equal 0, @spy.times_called(:method_call)
    end
    
    should "return the number of times a method was called" do
      5.times do
        @spy.method_call
      end
      assert_equal 5, @spy.times_called(:method_call)
    end
  end
  
end