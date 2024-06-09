// A test file of lintnet.
// https://lintnet.github.io/
function(param) [
  {
    name: 'pass',
    data_file: 'testdata/pass.json',
    result: [],
  },
  {
    name: 'invalid config',
    data_file: 'testdata/pass.json',
    result: [
      {
        name: "Destroyed S3 bucket's force_destroy must be true",
        message: 'config is invalid',
        custom: {
          errors: {
            errors: [
              {
                'error': "additional properties 'exclude' not allowed",
                instanceLocation: '',
                keywordLocation: '/additionalProperties',
                valid: false,
              },
            ],
            instanceLocation: '',
            keywordLocation: '',
            valid: false,
          },
        },
      },
    ],
    param: {
      config: {
        exclude: 'aws_s3_bucket.example',
      },
    },
  },
  {
    name: 'exclude',
    data_file: 'testdata/exclude.json',
    param: {
      config: {
        excludes: [
          'aws_s3_bucket.example',
          'aws_s3_bucket.example2',
        ],
      },
    },
    result: [],
  },
  {
    name: 'fail',
    data_file: 'testdata/fail.json',
    result: [
      {
        name: "Destroyed S3 bucket's force_destroy must be true",
        location: {
          address: 'aws_s3_bucket.example',
        },
      },
    ],
  },
  {
    name: 'force_destroy is enabled',
    data_file: 'testdata/enable_force_destroy.json',
    result: [],
  },
  {
    name: 'force_destroy is disabled',
    data_file: 'testdata/disable_force_destroy.json',
    result: [
      {
        name: "Destroyed S3 bucket's force_destroy must be true",
        location: {
          address: 'aws_s3_bucket.example',
        },
      },
    ],
  },
]
