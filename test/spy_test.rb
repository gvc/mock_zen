require_relative 'test_helper'

class SpyTest < Test::Unit::TestCase  
  
  def setup
    @spy = MockZen::Spy() 
  end

  test "record if a given method is called" do
    @spy.method_call
    assert @spy.called?(:method_call)
  end
  
  test "return false if the method wasn't called at all" do
    assert not(@spy.called?(:method_call))
  end
  
  test "return 0 if the method wasn't called at all" do
    assert_equal 0, @spy.times_called(:method_call)
  end
  
  test "return the number of times a method was called" do
    5.times do
      @spy.method_call
    end
    assert_equal 5, @spy.times_called(:method_call)
  end
end