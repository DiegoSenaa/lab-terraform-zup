terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }

    google = {
      source  = "hashicorp/google"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = var.aws_region
}

provider "google" {
  project = "zup"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = file("${path.module}/../keys/sonorous-pact-451318-e2-ebcceee755a4.json")
}

