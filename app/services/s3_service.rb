class S3Service
    attr_reader :s3, :bucket_name

    def initialize
      @s3 = Aws::S3::Client.new(region: Rails.application.credentials.dig(:aws, :region) || ENV['AWS_REGION'])
      @bucket_name = Rails.application.credentials.dig(:aws, :bucket_name) || ENV['S3_BUCKET_NAME']
    end
  
    def write_to_s3(consumer)
      consumer = JSON.parse(consumer)
      # Iterate through the consumer object
      consumer.each do |item|
        # Define the S3 object key
        city_name = item["capital"].first
        s3_key = "country_bucket_#{city_name}.json"

        # Convert the item value to JSON
        json_data = item.to_json

        # Write the JSON data to the S3 bucket
        s3.put_object(
          bucket: bucket_name,
          key: s3_key,
          body: json_data
        )

        puts "Uploaded file to s3://#{bucket_name}/#{s3_key}"
      end
    end
    
    # Retrieve file from s3
    def get_file(s3_key)
      s3.get_object(
        bucket: bucket_name,
        key: s3_key
      ).body.read
    end
    
    # Delete file from s3 bucket
    def delete_file(s3_key)
      s3.delete_object(
        bucket: bucket_name,
        key: s3_key
      )
    end

    # Upload files to s3 bucket
    def upload_file(file_path, s3_key)
      s3.put_object(
        bucket: bucket_name,
        key: s3_key,
        body: File.open(file_path)
      )
    end
  end
  