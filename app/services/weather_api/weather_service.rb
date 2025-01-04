module WeatherApi
    class WeatherService
        include ::Weather::WeatherSettings
        extend ExternalRequest::Request

        def self.fetch_current_weather(city)
            make_request("https://restcountries.com/v3.1/capital/#{city}")
        end

        private

        def self.return_generated_links
            normalized_countries = DEFAULT_COUNTRIES.each do |country|
                country.to_s
            end
        end
    end
end