# Capture via "random_name"
output "random_name" {
  value = random_pet.uniqueName.id
}

# dump entire resource
output "random_dump" {
  value = random_pet.uniqueName
}



