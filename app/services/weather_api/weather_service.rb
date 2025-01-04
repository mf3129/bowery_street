require 'net/http'
require 'uri'
require 'json'

module WeatherApi
    class WeatherService
        class TimeError < StandardError; end
        class SocketError < StandardError; end

        include ::Weather::WeatherSettings

        def self.fetch_current_weather(city)
            url = "https://restcountries.com/v3.1/capital/#{city}"
            uri = URI(url)

            http = self.setup_request(url, uri)

            begin
                request = Net::HTTP::Get.new(uri)
                

                # request.body = body.to_json if body
                response = http.request(request)

                case response
                when Net::HTTPSuccess
                    { status: response.code.to_i, message: "Success", body: response.body }
                else
                    { status: response.code.to_i, message: response.message, body: response.body }
                end
            rescue SocketError => e
                
                {status: 500, message: "Network Error #{e.message}"}
            rescue TimeError => e
                
                {status: 504, message: "Request timed out: #{e.message}"}
            rescue StandardError => e
                
                {status: 500, message: "Unexpected error: #{e.message}"}
            end
        end

        private

        def self.setup_request(url, uri)
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true if uri.scheme == "https"

            http
        end

        def self.return_generated_links
            normalized_countries = DEFAULT_COUNTRIES.each do |country|
                country.to_s
            end
        end
    end
end