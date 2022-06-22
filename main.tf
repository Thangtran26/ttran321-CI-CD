terraform {

  required_version = ">=0.14.9"

  backend "s3" {
       bucket = "ttran321-terraformstr"
       key    = "githubaction"
       region = "us-west-2"
   }

}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_s3_bucket" "s3Bucket" {
     bucket = "ttran321-webapp"
     acl       = "public-read"

     policy  = <<EOF
{
     "id" : "MakePublic",
   "version" : "2012-10-17",
   "statement" : [
      {
         "action" : [
             "s3:GetObject"
          ],
         "effect" : "Allow",
         "resource" : "arn:aws:s3:::ttran321-webapp/*",
         "principal" : "*"
      }
    ]
  }
EOF

   website {
       index_document = "index.html"
   }
}