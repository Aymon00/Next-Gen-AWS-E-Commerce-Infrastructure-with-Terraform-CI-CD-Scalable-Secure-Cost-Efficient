resource "aws_s3_bucket" "example" {
  bucket = "my-unique-bucket-name-12345"  
  acl     = "private" 

  versioning {
    enabled = true  
  }

}


  tags = {
    Environment = "Dev"
    Project     = "MyProject"
  }
}
