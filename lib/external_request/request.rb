require 'net/http'
require 'uri'
require 'json'

module ExternalRequest
    module Request
        class TimeError < StandardError; end
        class SocketError < StandardError; end

        def make_request(url)
            binding.pry
            uri = URI(url)

            http = setup_request(url, uri)
            http.open_timeout = 5
            http.read_timeout = 5

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
            rescue Net::OpenTimeout, Net::ReadTimeout => e
                {status: 504, message: "Timeout error: #{e.class} - #{e.message}"}
            rescue StandardError => e
                {status: 500, message: "Unexpected error: #{e.message}"}
            end
        end

        private

        def setup_request(url, uri)
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true if uri.scheme == "https"

            http
        end

        def return_generated_links
            normalized_countries = DEFAULT_COUNTRIES.each do |country|
                country.to_s
            end
        end
    end
end
