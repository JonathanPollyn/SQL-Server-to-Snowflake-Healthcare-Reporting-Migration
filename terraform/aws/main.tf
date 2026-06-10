resource "aws_s3_bucket" "healthcare_landing" {
  bucket = var.bucket_name

  tags = {
    Project = "HealthcareMigration"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.healthcare_landing.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.healthcare_landing.id

  rule{
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.healthcare_landing.id 

  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "folders" {
  for_each = toset([
    "raw/",
    "raw/patients/",
    "raw/providers/",
    "raw/appointments/",
    "raw/outpatient_visits/",
    "raw/inpatient_stays/",
    "raw/diagnoses/",
    "raw/lab_results/",
    "raw/medication/",
    "raw/pharmacy/",
    "raw/insurance/",
    "raw/vital_signs/",
    "processed/",
    "rejected/",
    "audit/"
  ])

  bucket  = aws_s3_bucket.healthcare_landing.id
  key     = each.value
  content = ""
}

resource "aws_iam_role" "snowflake_s3_role" {
  name = "snowflake-healthcare-s3-role"

assume_role_policy = jsonencode({
  Version = "2012-10-17"
  Statement = [
    {
      Effect = "Allow"
      Principal = {
        AWS = "arn:aws:iam::435321829355:user/5oru1000-s"
      }
      Action = "sts:AssumeRole"
      Condition = {
        StringEquals = {
          "sts:ExternalId" = "BB22271_SFCRole=4_PfGK/2JS5nP+Ce43Y5TRHNuJ37E="
        }
      }
    }
  ]
})
}

resource "aws_iam_policy" "snowflake_s3_policy" {
  name = "snowflake-healthcare-s3-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:GetObjectVersion"
        ]
        Resource = "${aws_s3_bucket.healthcare_landing.arn}/raw/*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket"
        ]
        Resource = aws_s3_bucket.healthcare_landing.arn
        Condition = {
          StringLike = {
            "s3:prefix" = [
              "raw/*"
            ]
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "snowflake_s3_attach" {
  role       = aws_iam_role.snowflake_s3_role.name
  policy_arn = aws_iam_policy.snowflake_s3_policy.arn
}