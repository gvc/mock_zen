module Mock

  # Error thrown when a method that wasn't recorded is called on a stub.
  class Mock::UndefinedActionError < RuntimeError
  end

end