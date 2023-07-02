output "vm_dokuwiki_ip" {
  value = module.ec2_dokuwiki.public_ip
}

output "domain" {
  value = local.domain
}
