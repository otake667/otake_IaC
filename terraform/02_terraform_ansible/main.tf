provider "aws" {
    region = "ap-northeast-1"
}

resource "aws_instance" "terraform_ansible" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    subnet_id = "${var.subnet_id}"
    key_name = "${var.key_name}"
    security_groups = ["${var.vpc_security_group_ids}"]
    tags = {
        Name = "terraform_ansible"
    }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = aws_instance.terraform_ansible.public_ip
      private_key = file("~/.ssh/xxxxxx")
    }
    inline = [
      "sudo yum install -y python"
    ]
    }
}

output "ec2_id" {
    value = aws_instance.terraform_ansible.id
}
output "ec2_public_ip" {
    value = aws_instance.terraform_ansible.public_ip
}
