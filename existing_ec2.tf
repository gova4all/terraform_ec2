# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_instance" "existing_ec2" {
  ami                                  = "ami-0ecb62995f68bb549"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1c"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = false
  enable_primary_ipv6                  = null
  get_password_data                    = false
  hibernation                          = false
  host_id                              = null
  host_resource_group_arn              = null
  iam_instance_profile                 = "ec2_role"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.medium"
 
  key_name                             = "Ec2_key"
  monitoring                           = false
  placement_group                      = null
  placement_partition_number           = 0
  private_ip                           = "172.31.25.205"
  secondary_private_ips                = []
  security_groups                      = [aws_security_group.web_sg.id]
  source_dest_check                    = true
  subnet_id                            = "subnet-06997a377f8ea7406"
  tags = {
    Name = "App_Server"
  }
  tags_all = {
    Name = "App_Server"
  }
  tenancy                     = "default"
  user_data                   = null
  user_data_base64            = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = [data.aws_security_group.default_sg.id]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    amd_sev_snp      = null
    core_count       = 2
    threads_per_core = 1
  }
  credit_specification {
    cpu_credits = "standard"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    kms_key_id            = null
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 15
    volume_type           = "gp3"
  }
}
data "aws_vpc" "default" {
  default = true
}
data "aws_security_group" "default_sg" {
  name= default


resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Security group for web server"
  vpc_id      = data.aws_vpc.default.id

  # Inbound Rules
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}
