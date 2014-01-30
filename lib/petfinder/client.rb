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

      raise StandardError.new("Bad HTTP response from the server") unless response.code.eql? 200

      raise StandardError.new("#{response.parsed_response["petfinder"]["header"]["status"]["message"]}") unless response.parsed_response["petfinder"]["header"]["status"]["code"]
      
      auth = response.parsed_response["petfinder"]["auth"]
      @session = Session.new(auth)
      @session.token
    end

    def sign_key_and_secret
      raise StandardError.new("API Secret is required") unless @api_secret
      Digest::MD5.hexdigest("#{@api_secret}key=#{@api_key}")
    end

  end

end
