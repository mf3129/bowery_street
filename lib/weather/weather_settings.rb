module Weather
    module WeatherSettings
        DEFAULT_COUNTRIES = [:barcelona, :mali, :paris, :amsterdam]
        BASE_URL = "https://api.nasa.gov/planetary/apod"
        API_KEY = ENV['NASA_API_KEY']

        def is_valid_country(entered_country)
            DEFAULT_COUNTRIES.include? entered_country
        end
    end
end