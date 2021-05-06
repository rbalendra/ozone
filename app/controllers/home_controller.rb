class HomeController < ApplicationController
  def index
      
    require 'net/http'
    require 'json'
    
    url = 'https://gateway.api.epa.vic.gov.au/environmentMonitoring/v1/sites?environmentalSegment=air'
    
    uri = URI(url)
    params = { :api_key => 'API_KEY' }
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get(uri)
    @output = JSON.parse(response)


end
end




