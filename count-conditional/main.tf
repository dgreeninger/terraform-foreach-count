variable "deploy_random_pet" {
  description = "Set to true to deploy a random pet, false to skip."
  type        = bool
  default     = false
}

provider "random" {
  # Configuration options (if any)
}

resource "random_pet" "example" {
  count = var.deploy_random_pet ? 1 : 0
  length = 2
}

output "random_pet_name" {
  value = random_pet.example[0].id
}
