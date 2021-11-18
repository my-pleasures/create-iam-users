resource "aws_iam_user" "iam" {
	count = length(var.iam_users)
	name  = element(var.iam_users, count.index)

	force_destroy = true
}

resource "aws_iam_access_key" "iam" {
	count = length(aws_iam_user.iam)
	user  = aws_iam_user.iam[count.index].name
}

resource "aws_ssm_parameter" "iam" {
  count = length(aws_iam_user.iam)

  name = "${var.ssm_parameter_prefix}/${aws_iam_user.iam[count.index].name}"
  type = "SecureString"
  value = templatefile("${path.module}/templates/iam-users.tpl", {
    iam_user              = aws_iam_user.iam[count.index].name,
    aws_access_key_id     = aws_iam_access_key.iam[count.index].id
    aws_secret_access_key = aws_iam_access_key.iam[count.index].secret
    enable_console_login  = var.enable_console_login
    login_password        = !var.enable_console_login ? "" : aws_iam_user_login_profile.iam[count.index].encrypted_password
  })
}

output "ssm_parameter" {
	value = aws_ssm_parameter.iam.*.name
}
