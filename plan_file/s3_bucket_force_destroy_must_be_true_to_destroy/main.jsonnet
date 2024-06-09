// A lint file of lintnet.
// https://lintnet.github.io/
// https://developer.hashicorp.com/terraform/internals/json-format
local validateJSONSchema = std.native('jsonschema.Validate');
local schema = import 'main_config_schema.json';

function(param)
  local vr = validateJSONSchema(schema, param.config);
  if vr != null then [
    {
      name: "Destroyed S3 bucket's force_destroy must be true",
      message: 'config is invalid',
      custom: {
        errors: vr,
      },
    },
  ] else [
    {
      name: "Destroyed S3 bucket's force_destroy must be true",
      location: {
        address: resource.address,
      },
    }
    for resource in param.data.value.resource_changes
    if resource.type == 'aws_s3_bucket' &&
      std.contains(resource.change.actions, 'delete') &&
      resource.change.before != null &&
      std.get(resource.change.before, 'force_destroy', false) != true &&
      !std.contains(std.get(param.config, 'excludes', []), resource.address)
  ]
