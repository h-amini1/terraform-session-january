    # Create Security Group 
    
    resource "aws_security_group" "security_task" {   
    name        = "security group"
    description = "enable TCP on port 22, 443, 3306"

# Ingress SSH allow the port 22 
    ingress {
        description      = "SSH access"
        from_port        = 22
        to_port          = 22 
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

# Ingress HTTP allow the port 80
    ingress {
        description      = "http access"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp" 
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"] 
    }

# Ingress HTTPS allow the port 443
    ingress {
        from_port        = 443
        to_port          = 443
        protocol         = "tcp" 
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = 3306
        to_port          = 3306
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

# Egress 
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"      # All Traffic   
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
      tags = {
    Name = "Task_tf_sg"
  }
} 
