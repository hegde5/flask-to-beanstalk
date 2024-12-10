terraform {
  backend "s3" {
    bucket         = "beanstalkterraformstate"            # TODO: Replace with your S3 bucket name
    key            = "terraform.tfstate"                  # Path to store the state file
    region         = "eu-central-1"                       # TODO: Same as your provider region
  }
}
