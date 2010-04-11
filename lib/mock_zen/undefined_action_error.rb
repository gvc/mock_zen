module MockZen

  # Error thrown when a method that wasn't recorded is called on a stub.
  class MockZen::UndefinedActionError < RuntimeError
  end

end