require 'aws-sdk-s3'

Aws.config.update({
  region: Rails.application.credentials.dig(:aws, :region) || ENV['AWS_REGION'],
  credentials: Aws::Credentials.new(
    Rails.application.credentials.dig(:aws, :access_key_id) || ENV['AWS_ACCESS_KEY_ID'],
    Rails.application.credentials.dig(:aws, :secret_access_key) || ENV['AWS_SECRET_ACCESS_KEY']
  )
})
