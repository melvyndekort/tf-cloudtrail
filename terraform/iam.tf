data "aws_iam_policy_document" "cloudtrail_deny" {
  statement {
    effect = "Deny"

    actions = [
      "cloudtrail:StopLogging",
      "cloudtrail:DeleteTrail",
      "cloudtrail:PutEventSelectors",
      "cloudtrail:UpdateTrail",
    ]

    resources = [
      aws_cloudtrail.cloudtrail.arn,
    ]
  }

  statement {
    effect = "Deny"

    actions = [
      "s3:Delete*",
      "s3:Put*",
      "s3:Replicate*",
      "s3:RestoreObject",
    ]

    resources = [
      aws_s3_bucket.cloudtrail.arn,
      "${aws_s3_bucket.cloudtrail.arn}/*",
    ]
  }
}

resource "aws_iam_role_policy" "admin" {
  name   = "cloudtrail_deny"
  role   = data.terraform_remote_state.tf_aws.outputs.admin_role_name
  policy = data.aws_iam_policy_document.cloudtrail_deny.json
}
