resource "aws_iam_user" "iam" {
	count = length(var.iam_users)
	name = element(var.iam_users, count.index)

	force_destroy = true
}

resource "aws_iam_access_key" "iam" {
	count = length(aws_iam_user.iam)
	user = aws_iam_user.iam[count.index].name
}

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
}
