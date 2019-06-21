variable "owner" {
  description = "Propietario del proyecto"
  type        = string
}

variable "project" {
  description = "Nombre del proyecto"
  type        = string
}

variable "env" {
  description = " 	Entorno de despliegue"
  type        = string
}

variable "runtime" {
  description = "Lenguaje usado en Lambda"
  type        = string
  default     = "python2.7"
}

variable "role_lambda" {
  description = "Rol de IAM adjunto a la Función Lambda"
  type        = string
}

variable "handler" {
  description = "La función de entrada en su código."
  type        = string
  default     = "index.handler"
}

variable "timeout" {
  description = "La cantidad de tiempo que su función Lambda tiene que ejecutarse en segundos."
  type        = string
  default     = "10"
}

variable "source_bucket" {
  description = "Bucket origen code Lambda source ZIP"
  type        = string
  default     = null
}

variable "source_prefix" {
  description = "S3 origen prefix code Lambda source ZIP"
  type        = string
  default     = null
}

variable "filename" {
  description = ""
  type        = string
  default     = null
}

variable "environment_variables" {
  description = "Los ajustes de configuración del entorno Lambda."
  type        = map
  default     = null
}

variable "memory_size" {
  description = "Cantidad de memoria usada en tiempo de ejecucion."
  type        = string
  default     = "128"
}


variable "source_types" {
  description = "Tipos de fuentes que pueden invocar el Lambda. Debe alinearse con las entradas en la variable source_arn"
  type        = "list"
  default     = []
}

variable "source_arns" {
  description = "Fuente de los ARN que pueden invocar el Lambda. Debe alinearse con las entradas en la variable source_types"
  type        = "list"
}
