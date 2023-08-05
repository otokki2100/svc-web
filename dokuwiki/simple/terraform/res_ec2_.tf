module "ec2_dokuwiki" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  name                        = "ec2-dokuwiki"
  instance_type               = var.ec2_dokuwiki.instance_type
  ami                         = var.ec2_dokuwiki.ami
  key_name                    = "rsa-keypair-${timestamp()}"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.dokuwiki.security_group_id]
  associate_public_ip_address = true
  private_ip                  = "10.0.101.11"

  user_data = templatefile("${var.wiki_code_path_local}/lang-code/shell/init/init-${var.ec2.dist}.sh.tpl", {
    user   = var.ec2.user,
    dist   = var.ec2.dist,
    domain = var.ec2.domain,
  })

  root_block_device = [{
    volume_size = "100"
    volume_type = "gp3"
    encrypted             = true
    delete_on_termination = true    
  }]

  tags = {
    Name = "ec2-dokuwiki"
  }
}
