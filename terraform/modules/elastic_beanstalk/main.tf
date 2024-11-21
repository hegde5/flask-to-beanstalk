resource "aws_elastic_beanstalk_application" "app" {
  name = var.app_name
}

resource "aws_elastic_beanstalk_environment" "env" {
  name                = "${var.environment}-${var.app_name}-env"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.4.5 running Python 3.8"

  settings {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }
}

resource "aws_iam_instance_profile" "beanstalk_profile" {
  name = "${var.environment}-${var.app_name}-instance-profile"
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.environment}-${var.app_name}-bucket"
  tags   = var.tags
}
