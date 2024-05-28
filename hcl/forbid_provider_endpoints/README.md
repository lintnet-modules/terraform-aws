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

```

## Config

No config.
