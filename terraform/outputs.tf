output "environment_url" {
  description = "The URL of the Elastic Beanstalk environment"
  value       = module.elastic_beanstalk.environment_url
}

output "environment_arn" {
  description = "The ARN of the Elastic Beanstalk environment"
  value       = module.elastic_beanstalk.environment_arn
}
