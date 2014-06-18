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
    expect(@pet.media.map{ |p| p.id }.uniq).to eql(2)
  end
end

