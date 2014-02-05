require 'spec_helper'

describe Petfinder::Pet do

  before(:all) do
    client = Petfinder::Client.new('abcde', '12345')
    @pet = client.get_pet('28432461')
  end

  it "should have correct name" do
    @pet.name.should == 'Charlie'
  end

  # it "should have id from hash" do
  #   @pet.id = 12345
  # end

  # it "should have shelter_id from hash" do
  #   @pet.id = 67890
  # end

  # it "should have nil sex" do
  #   @pet.sex.should be_nil
  # end

end
