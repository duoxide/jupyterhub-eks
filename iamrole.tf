resource "aws_iam_role" "eks_role" {
  name               = "role-for-eks"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "sts:AssumeRole"
            ],
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "eks.amazonaws.com"
                ]
            }
        }
    ]
}
EOF
}

### AWS policy ARN for existing service role

#data "aws_iam_policy" "codedeploy_service_policy" {
#arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
#  arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#}


### Policy attachment

resource "aws_iam_role_policy_attachment" "eks_policy_a" {
  count = length(var.iam_policy_arn)
  role  = aws_iam_role.eks_role.name
  #policy_arn = data.aws_iam_policy.codedeploy_service_policy.arn
  policy_arn = var.iam_policy_arn[count.index]
}