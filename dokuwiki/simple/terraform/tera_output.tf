output "vm_id" {
  value = module.ec2.id
}

output "vm_dokuwiki_ip" {
  value = module.ec2_dokuwiki.public_ip
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
