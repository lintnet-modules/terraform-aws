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

## How to fix

Before destroying a S3 bucket, you should set `force_destroy` to `true` and run `terraform apply`.
Or you can also edit Terraform State on your own risk and change `force_destroy` to `true`.

```tf
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"
  force_destroy = true
}
```

## Usage

```jsonnet
function(param) {
  targets: [
    {
      data_files: [
        '**/tfplan.json',
      ],
      modules: [
        'github_archive/github.com/lintnet-modules/terraform-aws/plan_file/s3_bucket_force_destroy_must_be_true_to_destroy/main.jsonnet@b0e00a40cb10d68f1d3e3a543a400fe589d293a2:v0.2.1',
      ],
    },
  ],
}
```

## Config

Nothing.
