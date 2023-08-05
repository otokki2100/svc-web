output "vm_id" {
  value = module.ec2.id
}

output "vm_ip" {
  value = module.ec2.public_ip
}

output "instance_type" {
  value = var.ec2.instance_type
}

output "vm_user" {
  value = var.ec2.user
}

output "vm_z_ssh" {
  value = "ssh ${var.ec2.user}@${module.ec2.public_ip} -o StrictHostKeyChecking=no -i id_rsa"
}

output "domain" {
  value = local.domain
}
