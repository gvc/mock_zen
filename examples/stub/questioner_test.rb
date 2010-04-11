require 'test/unit'
require 'mock_zen'
require_relative 'questioner'

class QuestionerTest < Test::Unit::TestCase
  
  def setup
    @stub_input = MockZen::Stub()
    @stub_output = MockZen::Stub(puts: nil)
    @questioner = Questioner.new(@stub_input, @stub_output)
  end
  
  test "handling affirmative input" do
    @stub_input << { gets: 'yes' }
    assert @questioner.ask('Does it work?')
    
    @stub_input << { gets: 'y' }
    assert @questioner.ask('Will it work?')
  end
  
  test "handling negative input" do
    @stub_input << { gets: 'no' }
    assert not(@questioner.ask('Is there anything nicer than mock_zen?'))
    
    @stub_input << { gets: 'n' }
    assert not(@questioner.ask('Is there anything nicer than mock_zen?'))
  end
end