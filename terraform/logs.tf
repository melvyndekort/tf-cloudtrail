resource "aws_cloudwatch_log_group" "cloudtrail" {
  name              = "CloudTrail"
  retention_in_days = 30
  kms_key_id        = data.terraform_remote_state.tf_aws.outputs.generic_kms_key_arn
}

data "aws_iam_policy_document" "cloudtrail_cloudwatch_logs_assume" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "cloudtrail_cloudwatch_logs" {
  name               = "cloudtrail-cloudwatch-logs"
  path               = "/system/"
  assume_role_policy = data.aws_iam_policy_document.cloudtrail_cloudwatch_logs_assume.json
}

data "aws_iam_policy_document" "cloudtrail_cloudwatch_logs" {
  statement {
    actions = [
      "logs:CreateLogStream",
    ]

    resources = [
      "${aws_cloudwatch_log_group.cloudtrail.arn}:log-stream:*",
    ]
  }

  statement {
    actions = [
      "logs:PutLogEvents",
    ]

    resources = [
      "${aws_cloudwatch_log_group.cloudtrail.arn}:log-stream:*",
    ]
  }
}

resource "aws_iam_role_policy" "cloudtrail_cloudwatch_logs" {
  name   = "terraform-20220627134356583800000001"
  role   = aws_iam_role.cloudtrail_cloudwatch_logs.id
  policy = data.aws_iam_policy_document.cloudtrail_cloudwatch_logs.json
}
