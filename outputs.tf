output "arn" {
  description = "El nombre de recurso de Amazon (ARN) que identifica su función Lambda."
  value = "${aws_lambda_function.this.arn}"
}

output "invoke_arn" {
  description = "El ARN que se utilizará para invocar la función Lambda desde la puerta de enlace de la API."
  value = "${aws_lambda_function.this.invoke_arn}"
}
