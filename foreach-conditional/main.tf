variable "deploy_random_pet" {
  description = "Control whether to deploy the random_pet resource"
  type        = bool
  default     = true
}

resource "random_pet" "example" {
  for_each = var.deploy_random_pet ? { "example" = "example" } : {}

  length    = 2
  separator = "-"
}

output "random_pet_names" {
  value       = [for pet in random_pet.example : pet.id]
  description = "Names of the deployed random_pet resources"
}
