provider "aws" {
  endpoints {
    dynamodb = "http://localhost:4569"
    s3       = "http://localhost:4572"
  }
}

provider "aws" {
  alias = "us-west-2"
  endpoints {
    dynamodb = "http://localhost:4000"
    s3       = "http://localhost:5000"
  }
}
