module Petfinder

	class Client

    include HTTParty

    base_uri 'http://api.petfinder.com/'
    format :xml

    def initialize(api_key=Petfinder.api_key, api_secret=Petfinder.api_secret)
      @api_key, @api_secret = api_key, api_secret
      raise StandardError.new("API key is required") unless @api_key
    end

    def get_token
      signature = digest_arguments
      session = self.class.get("/auth.getToken", {key: @api_key, sig: signature})
    end

    def digest_arguments(arguments={})
      signature = "#{@api_secret}key=#{@api_key}" # base signature
      arguments.each{ |key, value|  }
      Digest::MD5.hexdigest
    end

  end

end