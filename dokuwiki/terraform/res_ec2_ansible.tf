resource "local_file" "ansible_inventory" {
  filename        = "./hosts"
  file_permission = "0600"
  content  = <<-EOT
all:
  hosts:
    ec2_dokuwiki:
      ansible_host: ${module.ec2_dokuwiki.public_ip}
      ansible_connection: ssh
      ansible_user: ${var.ec2_dokuwiki.user}
      ansible_ssh_private_key_file: id_rsa
      ansible_ssh_common_args: "-o StrictHostKeyChecking=no"
  EOT
}
