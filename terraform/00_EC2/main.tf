provider "aws" {
    region = "ap-northeast-1"
}

resource "aws_instance" "terraform_test" {
    ami = "ami-xxxx"
    instance_type = "t2.micro"
    subnet_id = "subnet-xxxx"
    key_name = "xxxxx"
    count = 1
    tags = {
        Name = "terraform_test"
    }

}
