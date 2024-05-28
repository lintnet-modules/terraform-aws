function(param) [
  {
    name: 'pass',
    data_file: 'testdata/pass.tf',
    result: [],
  },
  {
    name: 'fail',
    data_file: 'testdata/fail.tf',
    result: [
      {
        name: "aws provider's endpoints is forbidden",
        links: [
          'https://engineering.mercari.com/en/blog/entry/20230706-bucket-full-of-secrets-terraform-exfiltration/',
          'https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/custom-service-endpoints',
        ],
        custom: {
          endpoints: [
            {
              dynamodb: 'http://localhost:4569',
              s3: 'http://localhost:4572',
            },
          ],
        },
      },
      {
        name: "aws provider's endpoints is forbidden",
        links: [
          'https://engineering.mercari.com/en/blog/entry/20230706-bucket-full-of-secrets-terraform-exfiltration/',
          'https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/custom-service-endpoints',
        ],
        location: {
          alias: 'us-west-2',
        },
        custom: {
          endpoints: [
            {
              dynamodb: 'http://localhost:4000',
              s3: 'http://localhost:5000',
            },
          ],
        },
      },
    ],
  },
]
