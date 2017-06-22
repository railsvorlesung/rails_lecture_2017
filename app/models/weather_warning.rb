class WeatherWarning 
  extend ActiveModel::Translation
  
  attr_accessor :title, :body
  
  # WeatherWarning.new
  # WeatherWarning.new(:url => 'test')
  def initialize(arguments = {})
    self.title = arguments[:title]
    self.body  = arguments[:body]
  end # #initialize



  def self.parse
    file = open(Rails.application.config.custom_config_variable[:weather_warnings], 'rb')
    html = Nokogiri::HTML(file)
    self.new({
      title: html.css('#wettertext h3').text
    })
  end

end
