require 'spec_helper'

describe Petfinder::HashConstructor do

  before(:all) do
    @klass = Class.new
    @klass.extend(Petfinder::HashConstructor)
  end

  it "should convert to snake case" do
    camel_case_string = "CamelCaseString"
    snake_case_string = @klass.to_snake_case(camel_case_string)
    snake_case_string.should == 'camel_case_string'
  end

end
