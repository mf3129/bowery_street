class FetchCountryJob < ActiveJob::Base
    queue_as :default 

    def perform(city)   
        weather_data = ::CountryApi::CountryService.fetch_current_city(city)
    end
end