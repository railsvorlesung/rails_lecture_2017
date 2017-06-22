require 'rails_helper'
describe WeatherWarning, type: :model, vcr: true do

  it 'should return a WeatherWarning object'  do
    expect(WeatherWarning.parse).to be_instance_of(WeatherWarning)

  end
end
