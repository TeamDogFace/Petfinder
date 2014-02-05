require 'petfinder'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

def get_response(filename)
  File.read(File.dirname(__FILE__) + "/responses/#{filename}")
end

def stub_get(request, filename)
  stub_request(:get, 'http://api.petfinder.com/' + request)
    .to_return(status: 200, body: get_response(filename))
end

RSpec.configure do |config|
  config.before(:each) do
    stub_get('auth.getToken?key=abcde&sig=35b86143f16f5f2cd1460317ed2d2723', 'token.xml')
    stub_get('breed.list?animal=dog&key=abcde', 'breeds.xml')
    stub_get('pet.get?id=28432461&key=abcde', 'pet.xml')
    stub_get('pet.getRandom?key=abcde', 'random.xml')
    stub_get('pet.getRandom?key=abcde&output=full', 'random.xml')
    stub_get('shelter.get?id=PA162&key=abcde', 'shelter.xml')
  end
end
