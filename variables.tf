variable "ami_id" {
  description = "ID da AMI"
  type        = string
  default     = "ami-024e6efaf93d85776"
}

variable "host_desafio" {
  description = "Conexão"
  type        = string
  default     = ""
}

 variable "free_tier" {
        description = "tipo da maquina que é free tiSer"
        type = string
        default = "t2.micro"
 } 

variable "private_key" {
  description = "Caminho para a chave privada"
  type        = string
  default     = "teste.pem"
}
