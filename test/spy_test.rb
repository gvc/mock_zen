require_relative 'test_helper'

class SpyTest < Test::Unit::TestCase  
  context "A spy" do

    should "record how many times a given method is called" do
      spy = Mock::Spy()
      5.times do
        spy.method_call
      end
      
      assert_equal 5, spy.called?(:method_call)
    end
    
    should "return 0 if the method wasn't called at all" do
      spy = Mock::Spy()
      
      assert_equal 0, spy.called?(:method_call)
    end
  end
  
end