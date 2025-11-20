# Security Policy

## Supported Versions

Only the latest version is supported with security updates.

## Reporting a Vulnerability

If you discover a security vulnerability, please send an email to security@mdekort.nl.
All security vulnerabilities will be promptly addressed.

Please do not report security vulnerabilities through public GitHub issues.

## Security Measures

This repository follows security best practices:
- All secrets are encrypted using AWS KMS
- Terraform state is stored securely in S3 with encryption
- Access is controlled through AWS IAM roles
- All changes go through pull request reviews
