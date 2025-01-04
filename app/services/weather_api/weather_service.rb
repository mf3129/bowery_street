module WeatherApi
    class WeatherService
        extend ExternalRequest::Request
        # include Weather::WeatherSettings

        def self.fetch_current_weather(city)
            make_request("https://restcountries.com/v3.1/capital/#{city}")
        end

        private

        # TBD: For the future

        # def self.return_generated_links
        #     normalized_countries = DEFAULT_COUNTRIES.each do |country|
        #         country.to_s
        #     end
        # end
    end
end