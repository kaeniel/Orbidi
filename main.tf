terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./vpc"

  vpc_cidr                   = var.vpc_cidr
  vpc_name                   = var.vpc_name
  igw_name                   = var.igw_name
  public_subnet_count        = var.public_subnet_count
  public_subnet_cidrs        = var.public_subnet_cidrs
  public_subnet_name_prefix  = var.public_subnet_name_prefix
  public_route_table_name    = var.public_route_table_name
}

module "alb" {
  source = "./alb"

  alb_name           = var.alb_name
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.public_subnet_ids
  alb_security_group = var.alb_security_group
}

module "ecs" {
  source = "./ecs"

  ecs_cluster_name      = var.ecs_cluster_name
  ecs_task_family       = var.ecs_task_family
  ecs_task_cpu          = var.ecs_task_cpu
  ecs_task_memory       = var.ecs_task_memory
  ecs_execution_role_arn= var.ecs_execution_role_arn
  ecs_task_role_arn     = var.ecs_task_role_arn
  fastapi_image         = var.fastapi_image
  environment_variable_value = var.environment_variable_value
  ecs_service_name      = var.ecs_service_name
  ecs_desired_count     = var.ecs_desired_count
  subnet_ids            = module.vpc.public_subnet_ids
  ecs_security_groups   = var.ecs_security_groups
  target_group_arn      = module.alb.target_group_arn
}

module "dynamodb" {
  source = "./dynamodb"

  dynamodb_table_name = var.dynamodb_table_name
}

module "s3" {
  source = "./s3"

  s3_bucket_name = var.s3_bucket_name
}