require 'spec_helper'

describe Petfinder::Client do

  before(:all) do
    @client = Petfinder::Client.new("abcde", "12345")
  end

  it "should return a valid token" do
    session = @client.get_token

    expect(session).to_not be_nil
    expect(session.token).to_not be_nil
    expect(session.expires).to eql("1391525412")
  end

  it "should return all the breeds of dogs" do
    dogs = @client.list_breeds("dog")

    expect(dogs.count).to eql(241)
    expect(dogs[0]).to eql('Affenpinscher')
  end

  it "should return pet with id 28432461" do
    pet = @client.get_pet('28432461')

    expect(pet).to_not be_nil
    expect(pet.name).to eql('Charlie')
    expect(pet.contact.zip).to eql("92865")
  end

  # it "should get a random pet"

end
