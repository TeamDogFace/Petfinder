require 'httparty'
require 'digest/md5'

require 'petfinder/version'
require 'petfinder/session'
require 'petfinder/client'
require 'petfinder/hash_constructor'

module Petfinder

  class << self
    attr_accessor :api_key, :api_secret
  end

  def self.configure
    yield self
  end

end
