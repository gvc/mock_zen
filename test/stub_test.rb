require_relative 'test_helper'

class StubTest < Test::Unit::TestCase

  test "fail if nothing is registered" do
    stub = MockZen::Stub()
    assert_raise MockZen::UndefinedActionError do 
      stub.method_call
    end
  end
  
  test "not fali if the method called is registered" do
    stub = MockZen::Stub(method_call: true)
    assert_nothing_raised do
      stub.method_call
    end
  end
  
  test "return what is defined on the hash" do
    stub = MockZen::Stub(method_call: true)
    assert stub.method_call
  end
  
  test "respond to an added behaviour" do
    stub = MockZen::Stub()
    assert_raise MockZen::UndefinedActionError do 
      stub.method_call
    end
    stub.add_behaviour(method_call: true)
    assert stub.method_call
  end
end