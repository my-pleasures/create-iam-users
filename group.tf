resource "aws_iam_group" "iam" {
	name = var.group_name
}

resource "aws_iam_user_group_membership" "iam" {
	count = length(aws_iam_user.iam)
	user = aws_iam_user.iam[count.index].name
	groups = [
		aws_iam_group.iam.name
	]
}

# Attaches a Managed IAM Policy to an IAM group
resource "aws_iam_group_policy_attachment" "iam" {
	group = aws_iam_group.iam.name
	policy_arn = data.aws_iam_policy.iam.arn
}

# PowerUserAccess Policy
data "aws_iam_policy" "iam" {
	arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

# devops-default-policy
resource "aws_iam_group_policy" "iam" {
	name  = "devops-default-policy"
	group = aws_iam_group.iam.name

	policy = jsonencode({
		Version = "2012-10-17"
		Statement = [
			{
				Action=[
					"iam:ListRoles",
					"iam:CreateServiceLinkedRole",
					"iam:DeleteServiceLinkedRole",
					"organizations:DescribeOrganization",
					"account:ListRegions",
					"iam:CreateRole",
					"iam:TagRole",
					"iam:GetRole",
					"iam:ListRolePolicies",
					"iam:ListAttachedRolePolicies",
					"iam:ListInstanceProfilesForRole",
					"iam:DeleteRole",
					"iam:AttachRolePolicy",
					"iam:CreateInstanceProfile",
					"iam:GetInstanceProfile",
					"iam:RemoveRoleFromInstanceProfile",
					"iam:DeleteInstanceProfile",
				]
				Effect = "Allow"
				Resource = "*"
			}
		]
	})
}

