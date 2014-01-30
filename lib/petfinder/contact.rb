module Petfinder

  class Contact
  	include HashConstructor
    attr_accessor :address1, :address2, :city, :state, :zip, :phone, :fax, :email
  end
end