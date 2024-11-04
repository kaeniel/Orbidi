# Variables for AWS provider
variable "aws_region" {
  description = "Región de AWS"
  type        = string
  default     = "us-west-2"
}

# Variables for VPC
variable "vpc_cidr" {
  description = "CIDR block de la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
  default     = "main-vpc"
}

variable "igw_name" {
  description = "Nombre del Internet Gateway"
  type        = string
  default     = "main-igw"
}

variable "public_subnet_count" {
  description = "Número de subnets públicas"
  type        = number
  default     = 2
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks de las subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_name_prefix" {
  description = "Prefijo de nombre para las subnets públicas"
  type        = string
  default     = "public-subnet"
}

variable "public_route_table_name" {
  description = "Nombre de la tabla de rutas pública"
  type        = string
  default     = "public-route-table"
}

# Variables for ALB
variable "alb_name" {
  description = "Nombre del ALB"
  type        = string
  default     = "my-alb"
}

variable "alb_security_group" {
  description = "ID del Security Group para el ALB"
  type        = string
}

# Variables for ECS
variable "ecs_cluster_name" {
  description = "Nombre del cluster ECS"
  type        = string
  default     = "main-cluster"
}

variable "ecs_task_family" {
  description = "Familia de la definición de tarea ECS"
  type        = string
  default     = "fastapi-task"
}

variable "ecs_task_cpu" {
  description = "CPU de la definición de tarea ECS"
  type        = string
  default     = "256"
}

variable "ecs_task_memory" {
  description = "Memoria de la definición de tarea ECS"
  type        = string
  default     = "512"
}

variable "ecs_execution_role_arn" {
  description = "ARN del rol de ejecución de ECS"
  type        = string
}

variable "ecs_task_role_arn" {
  description = "ARN del rol de tarea ECS"
  type        = string
}

variable "fastapi_image" {
  description = "Imagen del contenedor para FastAPI"
  type        = string
  default     = "tiangolo/uvicorn-gunicorn-fastapi:python3.8"
}

variable "environment_variable_value" {
  description = "Valor de la variable de entorno"
  type        = string
  default     = "production"
}

variable "ecs_service_name" {
  description = "Nombre del servicio ECS"
  type        = string
  default     = "fastapi-service"
}

variable "ecs_desired_count" {
  description = "Cantidad deseada de instancias del servicio ECS"
  type        = number
  default     = 1
}

variable "ecs_security_groups" {
  description = "IDs de los security groups para el ECS"
  type        = list(string)
}

variable "target_group_arn" {
  description = "ARN del target group para el ALB"
  type        = string
}

# Variables for DynamoDB
variable "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB"
  type        = string
  default     = "terraform-lock"
}

# Variables for S3
variable "s3_bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
  default     = "my-static-files"
}