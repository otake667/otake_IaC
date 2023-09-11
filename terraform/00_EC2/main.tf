provider "aws" {
    region = "ap-northeast-1"
}

resource "aws_instance" "terraform_test" {
    ami = "ami-07d6bd9a28134d3b3"
    instance_type = "t2.micro"
    subnet_id = "subnet-053b7bddd666f1476"
    key_name = "learn"
    count = 1
    tags = {
        Name = "terraform_test"
    }

}
