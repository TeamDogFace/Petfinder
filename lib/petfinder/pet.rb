module Petfinder

  class Pet
    include HashConstructor
    attr_accessor :id, :shelter_id, :shelter_pet_id, :name, :animal, :breeds,
      :mix, :age, :sex, :size, :options, :description, :last_update, :status, 
      :media, :contact

    # Some of data is deeper in the XML
    def breeds=(breeds)
      @breeds = breeds["breed"]
    end
    
    def options=(options)
      @options = options["option"]
    end

    def media=(media)
      @media = media["photos"]["photo"]
    end

    def contact=(contact)
      @contact = Contact.new(contact)
    end

  end

end