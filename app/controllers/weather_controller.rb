class WeatherController < ApplicationController
    def current
        Rails.logger.debug("Hit the Weather Controller")

        begin
            weather_data_response = ::FetchWeatherJob.perform_now(city)

            case weather_data_response[:status]
            when 200
                # files = S3Service.new.upload_file("/country_data_#{city}")
                files = S3Service.new.write_to_s3(weather_data_response[:body])
                puts files 
                render json: weather_data_response, status: :ok
            when 404
                render json: { error: "Resource not found"}, status: :not_found
            else
                render json: { error: weather_data_response[:message]}, status: :internal_server_error
            end
        rescue
        end
    end 

    private

    def city
        @city ||= params[:city]
    end
end
