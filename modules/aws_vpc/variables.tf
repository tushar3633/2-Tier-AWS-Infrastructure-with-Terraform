variable "project_name" {
  description = "Project name used for tagging all resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "vpc_cidr must be a valid CIDR block (e.g., 10.0.0.0/16)."
  }
}

variable "availability_zones" {
  description = "List of exactly 2 availability zones"
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) == 2
    error_message = "You must provide exactly 2 availability zones."
  }
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the 2 public subnets"
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "You must provide exactly 2 public subnet CIDRs."
  }
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the 2 private subnets"
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_cidrs) == 2
    error_message = "You must provide exactly 2 private subnet CIDRs."
  }
}