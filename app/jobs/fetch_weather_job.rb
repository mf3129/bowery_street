class FetchWeatherJob < ActiveJob::Base
    queue_as :default 

    def perform(city)   
        weather_data = ::WeatherApi::WeatherService.fetch_current_weather(city)
    end
end