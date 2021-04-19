# Capture via "random_name"
output "random_name" {
  value = random_pet.uniqueName.id
}

# dump entire resource
output "random_dump" {
  value = random_pet.uniqueName
}


output "domain-name" {
  value = aws_instance.web.public_dns
}

output "application-url" {
  value = "${aws_instance.web.public_dns}/index.php"
}


