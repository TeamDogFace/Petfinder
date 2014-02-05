require 'spec_helper'

describe Petfinder::Client do

  before(:all) do
    @client = Petfinder::Client.new('abcde', '12345')
  end

  it "should return a valid token" do
    session = @client.get_token

    expect(session).to_not be_nil
    expect(session.token).to_not be_nil
    expect(session.expires).to eq('1391525412')
  end

  it "should return all the breeds of dogs" do
    dogs = @client.list_breeds('dog')

    expect(dogs.count).to eql(241)
    expect(dogs[0]).to eq('Affenpinscher')
  end

  it "should return pet with id 28432461" do
    pet = @client.get_pet('28432461')

    expect(pet).to_not be_nil
    expect(pet.name).to eq('Charlie')
    expect(pet.contact.zip).to eq('92865')
  end

  it "should return random pets" do
    pets = @client.get_random_pet({output: 'full'})

    expect(pets.id).to eq('13836294')
  end

  it "should shelter with id PA162" do
    shelter = @client.get_shelter('PA162')

    expect(shelter.id).to eq('PA162')
    expect(shelter.city).to eq('Erie')
    expect(shelter.state).to eq('PA') 
  end

end
