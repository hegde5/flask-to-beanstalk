environment = "development"
app_name    = "dev-flask-app"
env_name    = "dev-flask-env"
instance_type = "t2.micro"
env_variables = {
  FLASK_ENV = "development"
}
tags = {
  Environment = "Development"
}
