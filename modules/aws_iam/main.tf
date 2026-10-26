resource "aws_iam_role" "ec2_role" {
  name = "${var.project_name}-ec2_role"
  assume_role_policy = jsondecode({
    Version = "2012-10-17"
    Statement=[
        {
            Effect = "Allow"
            Principal={
                Service = "ec2.amazonaws.com"
            }
            Action = "sts:AssumeRole"
        }
    ]
  })

  tags = {
    Name = "${var.project_name}-ec2-role"
  }
}

