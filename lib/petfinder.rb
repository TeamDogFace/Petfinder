require 'httparty'
require 'digest/md5'

require 'petfinder/hash_constructor'
require 'petfinder/session'
require 'petfinder/pet'
require 'petfinder/shelter'
require 'petfinder/contact'
require 'petfinder/client'
require 'petfinder/photo'
require 'petfinder/version'

module Petfinder

  class << self
    attr_accessor :api_key, :api_secret
  end

  def self.configure
    yield self
  end

end
