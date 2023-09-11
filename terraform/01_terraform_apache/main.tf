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
        type	= "ssh"
        user	= "ec2-user"
        private_key	= file("./ssh/learn.pem")
	host = aws_instance.terraform_ansible.public_ip
	}
	inline = [
	    "sudo yum -y install httpd",
	    "sudo systemctl start httpd"
	    ]
	}
}
