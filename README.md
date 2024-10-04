# Conway's Game of Life API

## Description

This project implements Conway's "Game of Life" using Ruby on Rails, providing an API to compute the next state of the board based on the game's rules. It also includes features to compute future states and detect stable or repeating patterns. The project is configured for production use with Docker and supports automated deployment using GitHub Actions and Terraform.

## Features

- Simulate multiple generations of the game.
- Compute future board states.
- Detect stable or cyclic patterns in the game.
- Implements a service layer pattern (`GameService`) for business logic.
- Automated deployment with Docker and GitHub Actions.
  
## Technologies Used

- Ruby on Rails
- PostgreSQL (for storing board states)
- Docker (for consistent environment management)
- GitHub Actions (for CI/CD)
- Terraform (for infrastructure provisioning)

## Installation

Follow these steps to set up the project locally:

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/conway-game-api.git
   cd conway-game-api
   ```

2. Install project dependencies:
   ```bash
   bundle install
   ```

3. Set up the PostgreSQL database:
   ```bash
   rails db:setup
   ```

4. Start the Rails server:
   ```bash
   rails s
   ```

The project will be accessible at `http://localhost:3000`.

## Usage

Here are some examples of how to use the API:

### 1. Compute the next board state:

**Request:**

```bash
GET /boards/:id/next_state
```

**Example response:**

```json
{
  "state": [
    [0, 1, 0],
    [0, 0, 1],
    [1, 1, 1]
  ]
}
```

### 2. Compute the state after N generations:

**Request:**

```bash
POST /boards/:id/future_state/:generations
```

**Example response:**

```json
{
  "state": [
    [0, 0, 0],
    [1, 0, 1],
    [0, 1, 1]
  ]
}
```

### 3. Detect a stable state or repeating pattern:

**Request:**

```bash
GET /boards/:id/final_state
```

## Running Tests

The project includes a suite of tests to validate the model behavior and game logic.

To run the tests, use the following command:

```bash
rails test
```

Example expected output:

```bash
Running tests...
Completed in 2.345s
12 tests, 24 assertions, 0 failures, 0 errors, 0 skips
```

## Docker

The project is configured to run with Docker, ensuring a consistent environment across development and production.

### Running with Docker

1. Ensure Docker is installed on your machine.
   
2. Build and run the containers using Docker Compose:

   ```bash
   docker-compose up --build
   ```

3. The application will be available at `http://localhost:3000`.

### Automated Deployment with Docker and GitHub Actions

This project includes a `.github/workflows/ci.yml` file that automates the deployment process. Each time code is pushed to the main branch, the GitHub Actions pipeline will:

1. Run tests.
2. Build a Docker image.
3. Push the Docker image to a container registry.
4. Deploy the application.

## Infrastructure Automation with Terraform

Terraform can be used to provision cloud infrastructure for the application. Example Terraform configurations for popular cloud providers (AWS, GCP, etc.) can be added in the `/terraform` directory.

### Example usage of Terraform:

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Plan the infrastructure changes:
   ```bash
   terraform plan
   ```

3. Apply the changes to provision resources:
   ```bash
   terraform apply
   ```

## Contributing

1. Fork the repository.
2. Create a new branch for your feature (`git checkout -b feature/awesome-feature`).
3. Commit your changes (`git commit -m 'Add awesome feature'`).
4. Push your branch (`git push origin feature/awesome-feature`).
5. Open a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

---
