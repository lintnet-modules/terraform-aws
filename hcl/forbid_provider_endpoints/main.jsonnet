function(param)
  [
    {
      name: "aws provider's endpoints is forbidden",
      links: [
        'https://engineering.mercari.com/en/blog/entry/20230706-bucket-full-of-secrets-terraform-exfiltration/',
        'https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/custom-service-endpoints',
      ],
      /*
      "provider": {
        "aws": [
          {
            "endpoints": [
              {
                "dynamodb": "http://localhost:4569",
                "s3": "http://localhost:4572"
              }
            ]
          }
        ]
      }
      */
      [if std.objectHas(awsP, 'alias') then 'location']: {
        alias: awsP.alias,
      },
      custom: {
        endpoints: awsP.endpoints,
      },
    }
    for awsP in std.get(std.get(param.data.value, 'provider', {}), 'aws', [])
    if std.objectHas(awsP, 'endpoints')
  ]
