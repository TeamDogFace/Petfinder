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
      query = {key: @api_key, sig: sign_secret_and_key}
      response = self.class.get("/auth.getToken", {query: query})

      # Eww
      raise StandardError.new("Bad HTTP response from the server") unless response.code.eql? 200

      raise StandardError.new("#{response.parsed_response["petfinder"]["header"]["status"]["message"]}") unless response.parsed_response["petfinder"]["header"]["status"]["code"]
      
      auth = response.parsed_response["petfinder"]["auth"]
      @session = Session.new(auth)
      @session.token
    end

    # I think there may be room for some Ruby block magic here...
    def list_breeds(animal_type, options={})
      query = {key: @api_key, animal: animal_type}.merge(options)
      response = self.class.get("/breed.list", {query: query})
      response.parsed_response["petfinder"]["breeds"]["breed"]
    end

    def get_pet(id, options={})
      query = {key: @api_key, id: id}.merge(options)
      response = self.class.get("/pet.get", {query: query})
      pet = response.parsed_response["petfinder"]["pet"]
      Pet.new(pet)
    end

    def get_random_pet(options={})
      query = {key: @api_key}.merge(options)
      response = self.class.get("/pet.getRandom", {query: query})
      pets = response.parsed_response["petfinder"]["pet"]
      pets.map{ |pet| Pet.new(pet) }
    end

    def find_pet(location, options={})
      query = {key: @api_key, location: location}.merge(options)
      response = self.class.get("/pet.find", {query: query})
      pets = response.parsed_response["petfinder"]["pets"]["pet"]
      pets.map{ |pet| Pet.new(pet) }
    end

    def find_shelter(location, options={})
      query = {key: @api_key, location: location}.merge(options)
      response = self.class.get("/shelters.find", {query: query})
      shelters = response.parsed_response["petfinder"]["shelters"]["shelter"]
      shelters.map{ |shelter| Shelter.new(shelter) }
    end

    def get_shelter(id, options={})
      query = {key: @api_key, id: id}.merge(options)
      response = self.class.get("/shelter.get", {query: query})
      shelter = response.parsed_response["petfinder"]["shelter"]
      Shelter.new(shelter)
    end

    def sign_secret_and_key
      raise StandardError.new("API Secret is required") unless @api_secret

      Digest::MD5.hexdigest("#{@api_secret}key=#{@api_key}")
    end

  end

end
