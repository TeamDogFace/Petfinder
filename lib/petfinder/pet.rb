module Petfinder

  class Pet
    include HashConstructor
    attr_accessor :id, :shelter_id, :shelter_pet_id, :name, :animal, :breeds,
     :mix, :age, :sex, :size, :last_updated, :status, :media, :contact
  end
end