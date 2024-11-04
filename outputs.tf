# Outputs for VPC
output "vpc_id" {
  description = "ID de la VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = module.vpc.public_subnet_ids
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

# Outputs for ALB
output "alb_arn" {
  description = "ARN del ALB"
  value       = module.alb.alb_arn
}

output "alb_dns_name" {
  description = "Nombre DNS del ALB"
  value       = module.alb.alb_dns_name
}

# Outputs for ECS
output "ecs_cluster_id" {
  description = "ID del cluster ECS"
  value       = module.ecs.ecs_cluster_id
}

output "ecs_task_definition_arn" {
  description = "ARN de la definición de tarea ECS"
  value       = module.ecs.ecs_task_definition_arn
}

output "ecs_service_name" {
  description = "Nombre del servicio ECS"
  value       = module.ecs.ecs_service_name
}

# Outputs for DynamoDB
output "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB"
  value       = module.dynamodb.dynamodb_table_name
}

# Outputs for S3
output "s3_bucket_arn" {
  description = "ARN del bucket S3"
  value       = module.s3.s3_bucket_arn
}

output "s3_bucket_website_url" {
  description = "URL del sitio web del bucket S3"
  value       = module.s3.s3_bucket_website_url
}