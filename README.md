
# Bowery Street Backend

## About

Bowery Street is a Ruby on Rails backend setup designed to replicate an Event-Driven Data Processing flow using AWS services like S3, Lambda, SNS, and SQS. The project integrates with a third-party API to collect country data. Currently, it is in development.

## Features

- **Event-Driven Data Processing**: Leverages AWS S3, Lambda, SNS, and SQS to handle asynchronous data flows.
- **AWS Integration**: Utilizes various Amazon Web Services for efficient data processing and storage.
  - **Amazon S3**: For object storage both for data source and data target.
  - **Amazon Lambda**: To execute code in response to events.
  - **Amazon SNS**: For pub/sub messaging and event triggering.
  - **Amazon SQS**: For queuing and processing messages.
- **Third-Party API Integration**: Collects country data from a third-party API and processes it within the event-driven architecture.
- **Modular Setup**: Designed to be extended and customized as development progresses.

## Setup Instructions

### Prerequisites

- Ruby 3.x
- Rails 7.x
- PostgreSQL (or your preferred database setup)
- AWS S3, Lambda, SNS, SQS access (credentials required)

### Installation Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/mf3129/bowery_street.git
   cd bowery_street
   ```

2. Install required gems:
   ```bash
   bundle install
   ```

3. Set up the database (adjust configuration as needed):
   ```bash
   rails db:create
   rails db:migrate
   ```

4. Set up AWS credentials:
   - Configure AWS credentials for S3, Lambda, SNS, and SQS in your environment variables (e.g., `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`).
   
5. Run the Rails server:
   ```bash
   rails server
   ```

6. Your backend should now be running at `http://localhost:3000`.

## Event-Driven Architecture

This application follows an event-driven model where events trigger various actions, including:

- Uploading data to S3.
- Processing data using AWS Lambda.
- Sending messages via SNS.
- Managing queues with SQS for event processing.

The system is designed to handle high-throughput, asynchronous operations, making it scalable for future development.

## API Integration

The project integrates with a third-party API to collect country data. Ensure that any required API keys or credentials are properly configured in the environment variables.

## Directory Structure

- `app/`: Contains the core Rails application components (models, controllers, etc.).
- `config/`: Configuration files for Rails and AWS service integrations.
- `lib/`: Custom libraries and services to handle API integration and event-driven architecture.
- `storage/`: Local storage setup for development before pushing data to AWS S3.

## Testing

Run tests with:
```bash
rails test
```

## Contributing

We welcome contributions! Please fork the repository and submit pull requests. When submitting a pull request, please make sure to:

- Include tests for any new functionality.
- Follow the existing code style and conventions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For questions, please contact [Makan Fofana](mailto:fofanamaka86@gmail.com).
