[${iam_user}]
aws_access_key_id = ${aws_access_key_id}
aws_secret_access_key = ${aws_secret_access_key}
%{ if enable_console_login == true ~}
console_login_password = ${login_password}
%{ endif ~}
