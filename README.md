# AWS Lambda Function Terraform module
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Terraform module which creates Function Lambda on AWS, compatible Terraform >= v0.12.1 .

These types of resources are supported:

* [Lambda Function](https://www.terraform.io/docs/providers/aws/r/lambda_function.html)


## Usage

```hcl
module "instance" {
    source                 = "git::ssh://git@github.com:davispalomino/terraform-aws-lambda.git"
    owner                  = "empresa"
    project                = "lambda"
    env                    = "dev"
    role_lambda            = "${aws_role_lambda_profile.this.arn}"
    runtime                = "python2.7"
    handler                = "lambda.lambda_handler"
    filename               = "file.zip"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment\_variables | Propietario del proyecto. | map | n/a | yes |
| environment\_variables | Nombre del proyecto. | map | n/a | yes |
| environment\_variables | Entorno de despliegue. | map | n/a | yes |
| environment\_variables | Los ajustes de configuración del entorno Lambda. | map | n/a | no |
| filename |  | string | n/a | no |
| handler | La función de entrada en su código. | string | `"index.handler"` | yes |
| memory\_size | Cantidad de memoria usada en tiempo de ejecucion. | string | `"128"` | no |
| role\_lambda | Rol de IAM adjunto a la Función Lambda | string | n/a | yes |
| runtime | Lenguaje usado en Lambda | string | `"python2.7"` | yes |
| source\_arns | Fuente de los ARN que pueden invocar el Lambda. Debe alinearse con las entradas en la variable source_types | list | n/a | no |
| source\_bucket | Bucket origen code Lambda source ZIP | string | n/a | no |
| source\_prefix | S3 origen prefix code Lambda source ZIP | string | n/a | no |
| source\_types | Tipos de fuentes que pueden invocar el Lambda. Debe alinearse con las entradas en la variable source_arn | list | `<list>` | no |
| timeout | La cantidad de tiempo que su función Lambda tiene que ejecutarse en segundos. | string | `"10"` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | El nombre de recurso de Amazon (ARN) que identifica su función Lambda. |
| invoke\_arn | El ARN que se utilizará para invocar la función Lambda desde la puerta de enlace de la API. |


## Usage Advance file
```hcl
module "instance" {
    source                = "git::ssh://git@github.com:davispalomino/terraform-aws-lambda.git"
    owner                 = "empresa"
    project               = "lambda"
    env                   = "dev"
    role_lambda           = "${aws_role_lambda_profile.this.arn}"
    runtime               = "python2.7"
    handler               = "lambda.lambda_handler"
    filename              = "file.zip"
    source_types          = ["events"]
    source_arns           = ["arn:aws:events:us-east-1:081713589812:rule/lambda-snapshot-backup-event-prod"]
    environment_variables ={
        TZ     = "America/Lima"
    }
}
```
## Authors

Davis Palomino http://101root.blogspot.pe.

## License

Apache 2 Licensed. See LICENSE for full details.