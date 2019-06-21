resource "aws_lambda_function" "this" {
    function_name   =   "${var.owner}-${var.env}-${var.project}"
    s3_bucket       =   "${var.source_bucket}"
    s3_key          =   "${var.source_prefix}"
    filename        =   "${var.filename}"
    source_code_hash=   "${var.filename  == null ? null : filebase64sha256(var.filename)}"
    role            =   "${var.role_lambda}"
    handler         =   "${var.handler}"
    runtime         =   "${var.runtime}"
    timeout         =   "${var.timeout}"
    memory_size     =   "${var.memory_size}"

    dynamic "environment" {
    for_each = var.environment_variables == null ? null : var.environment_variables
    content {
      variables = "${var.environment_variables}"
      }
    }

}

resource "aws_lambda_permission" "allow_source" {
  function_name = "${aws_lambda_function.this.function_name}"
  statement_id  = "AllowExecutionFrom${title(var.source_types[count.index])}"
  action        = "lambda:InvokeFunction"
  principal     = "${var.source_types[count.index]}.amazonaws.com"
  source_arn    = "${var.source_arns[count.index]}"
  count         = "${length(var.source_types)}"
}