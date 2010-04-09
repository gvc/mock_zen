require_relative 'mock/spy'
require_relative 'mock/stub'
require_relative 'mock/undefined_action_error'

module Mock
  
  # Creates a stub with the given actions
  def Mock::Stub(actions={})
    Stub.new(parse_actions(actions))
  end
  
  # Creates a Spy.
  def Mock::Spy()
    Spy.new
  end

protected
  # Ensures that the actions have Symbol or String keys
  def Mock::parse_actions(actions)
    actions.each do |key, value|
      if key.respond_to?(:to_sym)
        actions.delete key
        actions[key.to_sym] = value
      end
    end
  end
end