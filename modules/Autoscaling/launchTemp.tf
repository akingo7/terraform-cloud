
# --- Launch Template For Bastion Host ---

resource "aws_launch_template" "bastion-launch-template" {
  image_id               = lookup(var.ami, "bastion", "ami-0d527b8c289b4af7f")
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.bastion_security_group_id]

  iam_instance_profile {
    name = var.iam_instance_profile
  }

  key_name = aws_key_pair.keypair.key_name

  placement {
    availability_zone = var.availability_zone[0]
  }

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      var.tags,
      {
        Name = "bastion-launch-template"
      },
    )
  }

 # user_data = filebase64("${path.module}/../../scripts/bastion.sh")
}


# launch template for nginx

resource "aws_launch_template" "nginx-launch-template" {
  image_id               = lookup(var.ami, "nginx", "ami-0d527b8c289b4af7f")
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.nginx_security_group_id]

  iam_instance_profile {
    name = var.iam_instance_profile
  }

  key_name = aws_key_pair.keypair.key_name

  placement {
    availability_zone = var.availability_zone[0]
  }

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      var.tags,
      {
        Name = "nginx-launch-template"
      },
    )
  }
  # user_data = base64(templatefile("${path.module}/../../scripts/nginx.sh", {internalLB = var.internal_lb_dns_name}))
 # user_data = filebase64("${path.module}/../../scripts/nginx.sh")
}


# launch template for wordpress

resource "aws_launch_template" "wordpress-launch-template" {
  image_id               = lookup(var.ami, "wordpress", "ami-0d527b8c289b4af7f")
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.webservers_security_group_id]

  iam_instance_profile {
    name = var.iam_instance_profile
  }

  key_name = aws_key_pair.keypair.key_name

  placement {
    availability_zone = var.availability_zone[0]
  }

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      var.tags,
      {
        Name = "wordpress-launch-template"
      },
    )

  }

 # user_data = filebase64("${path.module}/../../scripts/wordpress.sh")
}



# launch template for toooling
resource "aws_launch_template" "tooling-launch-template" {
  image_id               = lookup(var.ami, "tooling", "ami-0d527b8c289b4af7f")
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.webservers_security_group_id]

  iam_instance_profile {
    name = var.iam_instance_profile
  }

  key_name = aws_key_pair.keypair.key_name

  placement {
    availability_zone = var.availability_zone[0]
  }

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      var.tags,
      {
        Name = "tooling-launch-template"
      },
    )

  }

 # user_data = filebase64("${path.module}/../../scripts/tooling.sh")
}
