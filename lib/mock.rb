require_relative 'mock/stub'
require_relative 'mock/undefined_action_error'

module Mock
  
  # Creates a stub with the given actions
  # The hash of actions
  def Mock::Stub(actions={})
    Stub.new(parse_actions(actions))
  end
  
  
private  
  def Mock::parse_actions(actions)
    actions.reject! do |key, value| 
      !key.instance_of?(String) and !key.instance_of?(Symbol)
    end
    
    actions.each do |key, value|
      if key.instance_of? String
        actions.delete key
        actions[key.to_sym] = value
      end
    end
  end
end