# s3_bucket_force_destroy_must_be_true_to_destroy

Destroyed S3 buckets' [force_destroy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#force_destroy) must be `true`.

e.g.

```tf
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"
  # force_destroy = true
}
```

## Why?

To destroy a S3 bucket having some objects, `force_destroy` is required.
Otherwise, `terraform apply` fails.

## Usage

```jsonnet
function(param) {
  targets: [
    {
      data_files: [
        '**/*.tf',
      ],
      modules: [
        'github_archive/github.com/lintnet-modules/terraform-aws/plan_file/s3_bucket_force_destroy_must_be_true_to_destroy/main.jsonnet@4f81d84e6495489c68e4f9e7c7a657b30a2ce7fa:v0.2.0',
      ],
    },
  ],
}
```

## Config

- `excludes`: A list of excluded S3 bucket resource address, not bucket name

```jsonnet
modules: [
  {
    path: 'github_archive/github.com/lintnet-modules/terraform-aws/plan_file/s3_bucket_force_destroy_must_be_true_to_destroy/main.jsonnet@4f81d84e6495489c68e4f9e7c7a657b30a2ce7fa:v0.2.0',
    config: {
      excludes: [
        'aws_s3_bucket.example',
      ],
    },
  },
],
```
