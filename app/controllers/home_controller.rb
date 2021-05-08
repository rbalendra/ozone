class HomeController < ApplicationController
  def index
      
    require 'net/http'
    require 'json'
    

    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=89129&distance=2&API_KEY=E254B2FB-2C0C-4A9D-8514-CA8389847F79'


    # @url = 'https://gateway.api.epa.vic.gov.au/environmentMonitoring/v1/sites?environmentalSegment=air'

    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)




    #check for empty return results
    if @output.empty?
    @final_output = "Error"
    elsif !@output 
      @final_output = "Error"
      else
    @final_output = @output[0]['AQI']
    end

    if @final_output == 'Error'
      @api_color == "gray"
    elsif @final_output <= 50
      @api_color = 'green'
    elsif @final_output >=51 && @final_output <= 100
      @api_color = 'yellow'
    elsif @final_output >=101 && @final_output <= 150
      @api_color = 'orange'
    elsif @final_output >=151 && @final_output <= 200
      @api_color = 'red'
    elsif @final_output >201 && @final_output <= 300
      @api_color = 'purple'
    elsif @final_output >=301 && @final_output <= 500
      @api_color = 'maroon'
    end

  

  end
end




