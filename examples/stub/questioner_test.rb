require 'test/unit'
require 'mock'
require_relative 'questioner'

class QuestionerTest < Test::Unit::TestCase
  
  test "handling invalid input" do
    spy = Mock::Spy()
    questioner = Questioner.new
  end
  
end