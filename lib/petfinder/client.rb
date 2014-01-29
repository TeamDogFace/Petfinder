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
      query = {key: @api_key, sig: sign_key_and_secret}
      response = self.class.get("/auth.getToken", {query: query})

      raise StandardError.new("Bad HTTP response from the server") unless response.code.eql?(200)
      
      # Parse response.body XML

    end

    def sign_key_and_secret
      raise StandardError.new("API Secret is required") unless @api_secret
      Digest::MD5.hexdigest("#{@api_secret}key=#{@api_key}")
    end

    # def digest_arguments(options={})
    #   signature = "#{@api_secret}key=#{@api_key}" # base signature
    #   options.each{ |key, value|  }
    #   Digest::MD5.hexdigest
    # end

  end

end
