require_relative 'test_helper'

class StubTest < Test::Unit::TestCase

  context "An stub" do
    should "fail if nothing is registered" do
      stub = Mock::Stub()
      assert_raise Mock::UndefinedActionError do 
        stub.method_call
      end
    end
    
    should "not fali if the method called is registered" do
      stub = Mock::Stub(method_call: true)
      assert_nothing_raised do
        stub.method_call
      end
    end
    
    should "return what is defined on the hash" do
      stub = Mock::Stub(method_call: true)
      assert stub.method_call
    end
    
    should "respond to an added behaviour" do
      stub = Mock::Stub()
      assert_raise Mock::UndefinedActionError do 
        stub.method_call
      end
      stub.add_behaviour(method_call: true)
      assert stub.method_call
    end
  end
end