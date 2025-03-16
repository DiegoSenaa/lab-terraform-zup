variable "aws_region" {
  description = "Região da AWS"
  type        = string
  validation {
    condition     = contains(["us-east-1", "us-west-2", "eu-west-1"], var.aws_region)
    error_message = "A região da AWS deve ser 'us-east-1', 'us-west-2' ou 'eu-west-1'."
  }
}

variable "gcp_region" {
  description = "Região do GCP"
  type        = string
  validation {
    condition     = contains(["us-central1", "europe-west1", "asia-east1"], var.gcp_region)
    error_message = "A região do GCP deve ser 'us-central1', 'europe-west1' ou 'asia-east1'."
  }
}

variable "cidr_block" {
  description = "Bloco CIDR para a AWS VPC"
  type        = string
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.cidr_block))
    error_message = "O CIDR deve estar no formato correto, ex: '192.168.1.0/24'."
  }
}

variable "gcp_network_name" {
  description = "Nome da rede no GCP"
  type        = string
}

variable "environment" {
  description = "Ambiente de implantação"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "O ambiente deve ser 'dev', 'staging' ou 'prod'."
  }
}
