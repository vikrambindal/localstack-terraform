resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.bucket.id

  queue {
    queue_arn = aws_sqs_queue.queue.arn
    events    = ["s3:ObjectCreated:*"]
  }
}

resource "aws_sqs_queue" "queue" {

  name = var.queue_name
}

resource "aws_sqs_queue_policy" "queue_policy" {
  queue_url = aws_sqs_queue.queue.id
  policy    = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [{
        "Effect"    : "Allow",
        "Principal" : "*",
        "Action"    : "sqs:SendMessage",
        "Resource"  : "arn:aws:sqs:*:*:${var.queue_name}",
        "Condition" : {
            "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.bucket.arn}"}
        }
    }]
}
POLICY
}