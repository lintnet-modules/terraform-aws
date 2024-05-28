# forbid_provider_endpoints

This lint rule forbids AWS provider's endpoints.

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/custom-service-endpoints

e.g.

```tf
provider "aws" {
  # ... potentially other provider configuration ...
  endpoints {
    dynamodb = "http://localhost:4569"
    s3       = "http://localhost:4572"
  }
}
```

## Why?

Attackers can abuse AWS provider's endpoints to take secrets away.

https://engineering.mercari.com/en/blog/entry/20230706-bucket-full-of-secrets-terraform-exfiltration/

## Usage

```jsonnet
function(param) {
  targets: [
    {
      data_files: [
        '**/*.tf',
      ],
      modules: [
        'github_archive/github.com/lintnet-modules/terraform-provider-aws/hcl/forbid_provider_endpoints/main.jsonnet@0f350f659c7c64c7398249ea0fc23d1cec45c12a:v0.1.0',
      ],
    },
  ],
}
```

## Config

No config.
