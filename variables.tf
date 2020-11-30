## Конфиг с описанием переменных и значениями по дефолту, если дефолтных значений нет, то они являются обязательными ##

# Секретные переменные - берутся из "secret.tfvars"
variable oauth_token  {
  type = string
}
variable cloud_id {
  type = string
}
variable directory_id {
  type = string
}

variable "ssh_key" {
  type        = string
  description = "SSH-ключ для подключения к виртуальной машине"
  default = ""
}

variable "vm_user_name" {
  type        = string
  description = "Пользователь, который будет создан при создании виртуальной машины"
  default     = "beaver"
}

# Общие переменные - берутся из "variables.tfvars"
variable default_zone {
  type = string
}

variable "yc_image" {
  type = map
}

variable "yc_disk_type" {
  type = map
}

variable "yc_vm_platform_type" {
  type = map
}