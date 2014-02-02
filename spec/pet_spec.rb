require 'spec_helper'

describe Petfinder::Pet do

  before(:all) do
    @hash = {id: 12345, shelter_id: 67890, name: 'Rover'}
    @pet = Petfinder::Pet.new(@hash)
  end

  it "should have name from hash" do
    @pet.name.should == 'Rover'
  end

  it "should have id from hash" do
    @pet.id = 12345
  end

  it "should have shelter_id from hash" do
    @pet.id = 67890
  end

  it "should have nil sex" do
    @pet.sex.should be_nil
  end

end
