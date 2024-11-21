module "elastic_beanstalk" {
  source        = "./modules/elastic_beanstalk"
  environment   = var.environment
  app_name      = var.app_name
  instance_type = var.instance_type
  tags          = var.tags
}

output "environment_url" {
  description = "The URL of the Elastic Beanstalk environment"
  value       = module.elastic_beanstalk.environment_url
}

output "environment_arn" {
  description = "The ARN of the Elastic Beanstalk environment"
  value       = module.elastic_beanstalk.environment_arn
}
