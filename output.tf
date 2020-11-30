# Идентификатор сервисного аккаунта
output "service_account_id" {
  value = yandex_iam_service_account.servitor.id
}

# Внутренний ip виртуальной машины
output "internal_ip_address_vm" {
  value = yandex_compute_instance.vm.network_interface.0.ip_address
}

# Внешний ip виртуальной машины
output "external_ip_address_vm" {
  value = yandex_compute_instance.vm.network_interface.0.nat_ip_address
}