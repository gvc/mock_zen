require_relative 'mock_zen/spy'
require_relative 'mock_zen/stub'
require_relative 'mock_zen/undefined_action_error'

module MockZen
  
  # Creates a stub with the given actions
  def MockZen::Stub(actions={})
    Stub.new(parse_actions(actions))
  end
  
  # Creates a Spy.
  def MockZen::Spy()
    Spy.new
  end

protected
  # Ensures that the actions have Symbol or String keys
  def MockZen::parse_actions(actions)
    actions.each do |key, value|
      if key.respond_to?(:to_sym)
        actions.delete key
        actions[key.to_sym] = value
      end
    end
  end
end