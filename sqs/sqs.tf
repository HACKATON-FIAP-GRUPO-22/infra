resource "aws_sqs_queue" "processar" {
  name  = "processar"
}

resource "aws_sqs_queue" "processados" {
  name  = "processados"
}