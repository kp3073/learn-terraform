

resource "aws_s3_bucket" "bucket12" {
  bucket = "my-tf-test-bucket9999asd9u942"
}


backend "s3" {
  bucket         	   = "my-tf-test-bucket9999asd9u942"
  key              	   = "terraform.tfstate"
  region         	   = "us-east-1"
}
}