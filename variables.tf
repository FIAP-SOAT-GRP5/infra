variable "accountId" {
  description = "Account ID"
  type        = string
}

variable "region" {
  description = "Region for AWS resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "load_balancer_dns" {
  description = "EKS Load Balancer DNS"
  type        = string
}

variable "load_balancer_arn" {
  description = "EKS Load Balancer ARN"
  type        = string
}

variable "settings" {
  description = "Settings for the RDS"
  type        = map(any)
  default = {
    "database" = {
      "allocated_storage"   = 20
      "db_name"             = "fiap_db"
      "engine"              = "mysql"
      "engine_version"      = "8.0.33"
      "instance_class"      = "db.t2.micro"
      "skip_final_snapshot" = true
      "publicly_accessible" = true
      "multi_az"            = false
      "identifier"          = "fiap-db"
    }
    "ecr" = {
      "repository_name"      = "fiap-grp5"
      "force_delete"         = true
      "image_tag_mutability" = "MUTABLE"
      "scan_on_push"         = true
    }
  }
}

variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
  ]
}

variable "private_subnet_cidr_blocks" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
  ]
}

variable "db_username" {
  description = "Username for the database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}
