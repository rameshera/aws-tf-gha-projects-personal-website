resource "aws_s3_bucket" "static_site" {
  bucket = var.bucket_name
}

# resource "aws_s3_bucket_website_configuration" "static_website_config" {
#   bucket = aws_s3_bucket.static_site.id

#   index_document {
#     suffix = "index.html"
#   }
# }

resource "aws_s3_bucket_public_access_block" "static_site_access" {
  bucket                  = aws_s3_bucket.static_site.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# resource "aws_s3_bucket_policy" "static_site_policy" {
#   bucket = aws_s3_bucket.static_site.id
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect    = "Allow"
#         Principal = "*"
#         Action    = "s3:GetObject"
#         Resource  = "${aws_s3_bucket.static_site.arn}/*"
#       }
#     ]
#   })

#   depends_on = [ aws_s3_bucket_public_access_block.static_site_access ]
# }

resource "aws_acm_certificate" "ehsanshekari_cert" {
  domain_name = "ehsanshekari.com"
  validation_method = "DNS"

  subject_alternative_names = ["www.ehsanshekari.com"]
  
  tags = {
    Name = "ehsanshekari.com SSL Certificate"
  }

  lifecycle {
    create_before_destroy = true
  }
}
