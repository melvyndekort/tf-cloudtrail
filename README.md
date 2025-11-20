# tf-cloudtrail

Terraform configuration for AWS CloudTrail setup.

## Resources

- CloudTrail trail with multi-region logging
- S3 bucket for log storage with encryption and lifecycle policies
- CloudWatch log group for real-time monitoring
- IAM roles and policies for CloudTrail operation
- Security policies to prevent tampering

## Dependencies

- tf-aws: KMS key and admin role
