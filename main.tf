terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "random" {}


variable "pet_names" {
  description = "A list of pet names to generate"
  type        = list(string)
  default     = ["cat", "dog", "mouse"]
}

resource "random_pet" "foreach_pets" {
  for_each = toset(var.pet_names)
  length    = 2
  separator = "-"
}

output "foreach_pet_names" {
  value = { for k, v in random_pet.foreach_pets : k => v.id }
}

variable "number_of_pets" {
  description = "The number of random pet names to generate"
  type        = number
  default     = 3
}

resource "random_pet" "count_pets" {
  count = var.number_of_pets
}

output "count_pet_names" {
  value = [for pet in random_pet.foreach_pets : pet.id]
}
