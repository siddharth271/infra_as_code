variable "region" {
  default = "us-east-1"
}


variable "shared_credentials_file" {
  default = "C:\\Users\\{user_name}\\.aws\\credentials"
	# AWS credentials file
}

variable "profile" {
  default = "terraform"
}

provider "datadog" {
  api_key = "Enter the API Key"
  app_key = "Enter the App key"
}


provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "${var.shared_credentials_file}"
  profile                 = "${var.profile}"
}
resource "aws_security_group" "launch6" {
    name = "launch6"
    # Open up incoming ssh port
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    

    # Open up outbound internet access
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "web" {

connection={
        user="ubuntu"
        private_key="${file(var.key_path)}"
		agent = false
    }

  ami = "ami-2d39803a"
  instance_type = "t1.nano"
  count = 2
  key_name = "terraform"
security_groups= ["launch6"]  
	# Security group of AWS
 
  tags {
    Name = "terraform"
  }
  }
resource "datadog_monitor" "cpu_monitor" {
  name = "cpu usage high"
  type = "metric alert"
  message = "CPU usage alert. Notify: @email@example.com"
  query = "avg(last_2m):avg:system.cpu.system{*} by {host} > 90"

  
}

resource "datadog_monitor" "disk_usage" {
  name           = "Disk usage high"
  query          = "avg(last_5m):max:system.disk.in_use{*} by {host} * 100 > 80"
  type           = "metric alert"
  message = "RAM usage alert. Notify: @email@example.com"
  

 
}

