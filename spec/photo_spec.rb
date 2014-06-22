require 'spec_helper'

describe Petfinder::Photo do
  
  before(:each) do
    client = Petfinder::Client.new('abcde', '12345')
    @pet = client.get_pet('28432461')
  end

  it "should have ten photos" do
    expect(@pet.media.length).to eql(10)
  end

  it "should have two different photos" do
    uniq_photos = @pet.media.map{ |p| p.id }.uniq
    expect(uniq_photos.length).to eql(2)
  end

  it "should have correct url" do
    url = "http://photos.petfinder.com/photos/US/CA/CA1066/28432461/CA1066.28432461-1-x.jpg"
   expect(@pet.media.first.url).to eql(url) 
  end
end

