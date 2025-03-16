variable "resource_tags" {
    type = map(string)
    default = {
    "batata" = "doce"
  }
}

locals {
  required_tags = {
      "project" = "Zup",
      "environment" = "prod"
  }
  tags = merge(var.resource_tags, local.required_tags)
}

output "tags" {
  value = local.tags
}

output "tags_project" {
  value = local.tags.project
}