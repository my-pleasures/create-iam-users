locals {

}

# resource "null_resource" "mappings" {
# 	count = length(var.iam_users)

# 	triggers {
# 		aws_access_key_id     = aws_iam_access_key.iam[count.index].id
# 		aws_secret_access_key = aws_iam_access_key.iam[count.index].secret
# 		# login_password        = "${aws_iam_user_login_profile.iam[count.index].encrypted_password}"
# 	}
# }