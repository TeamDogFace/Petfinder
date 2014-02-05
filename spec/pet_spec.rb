require 'spec_helper'

describe Petfinder::Pet do

  before(:each) do
    client = Petfinder::Client.new('abcde', '12345')
    @pet = client.get_pet('28432461')
  end

  it "should have correct name" do
    expect(@pet.name).to eql('Charlie')
  end

  it "should have id from hash" do
    expect(@pet.id).to eql('28432461')
  end

  it "should have valid images" do
    expect(@pet.media.count).to eql(10)
  end

  it "shoudl have correct contact" do
    expect(@pet.contact.city).to eql('Orange')
    expect(@pet.contact.state).to eql('CA')
  end

end
