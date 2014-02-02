module Petfinder

  class Shelter
    include HashConstructor
    attr_accessor :id, :name, :address1, :address2, :city, :state, :zip, :country,
     :latitude, :longitude, :phone, :fax, :email
  end

end