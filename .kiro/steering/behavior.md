# tf-cloudtrail

> For global standards, way-of-workings, and pre-commit checklist, see `~/.kiro/steering/behavior.md`

## Role

Cloud Engineer specializing in Terraform and AWS security.

## Important Notes

- This repo has NO Makefile and NO encrypted secrets
- CloudTrail has security policies to prevent tampering — be careful with bucket policies and IAM

## Repository Structure

- `terraform/main.tf` — CloudTrail trail (multi-region)
- `terraform/bucket.tf` — S3 bucket for log storage (encrypted, lifecycle policies)
- `terraform/logs.tf` — CloudWatch log group for real-time monitoring
- `terraform/iam.tf` — IAM roles and policies for CloudTrail
- `terraform/remote-state.tf` — References tf-aws (KMS key, admin role)

## Terraform Details

- Backend: S3 key `tf-cloudtrail.tfstate` in `mdekort-tfstate-075673041815`
- Providers: AWS `~> 6.0`

## Related Repositories

- `~/src/melvyndekort/tf-aws` — Provides KMS key and admin role via remote state
