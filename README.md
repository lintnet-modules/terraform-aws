# terraform-aws

A lintnet module for Terraform AWS Provider

## Rules

- [hcl/forbid_provider_endpoints](hcl/forbid_provider_endpoints): Forbid AWS Provider's `endpoints` attribute
- [plan_file/s3_bucket_force_destroy_must_be_true_to_destroy](plan_file/s3_bucket_force_destroy_must_be_true_to_destroy): Destroyed S3 buckets' [force_destroy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#force_destroy) must be `true`.

## LICENSE

[MIT](LICENSE)
