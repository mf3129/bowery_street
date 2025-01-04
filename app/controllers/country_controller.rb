class CountryController < ApplicationController
    def current
        begin
            country_data_response = ::FetchCountryJob.perform_now(city)

            case country_data_response[:status]
            when 200
                files = S3Service.new.write_to_s3(country_data_response[:body])

                puts files 
                render json: country_data_response, status: :ok
            when 404
                render json: { error: "Resource not found"}, status: :not_found
            else
                render json: { error: country_data_response[:message]}, status: :internal_server_error
            end
        rescue
        end
    end 

    private

    def city
        @city ||= params[:city]
    end
end
