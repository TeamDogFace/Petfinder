module Petfinder

  class Session
    include HashConstructor
  	attr_accessor :key, :token, :expires, :expires_string
  end

end