# Настройки провайдера
provider "yandex" {
  token     = var.oauth_token
  cloud_id  = var.cloud_id
  folder_id = var.directory_id
  zone      = var.default_zone
}

// Сервисный аккаутн (аккаунт от имени которого будут производиться автоматические действия этакий аккаунт бота)
resource "yandex_iam_service_account" "servitor" {
  name        = "servitor"
  description = "Основной технический аккаунт"
}

resource "yandex_compute_instance" "vm" {
  name        = "app1"
  platform_id = var.yc_vm_platform_type.standard_1
  zone        = var.default_zone

  resources {
    cores         = 2  // Коичество виртуальных ядер
    memory        = 2  // RAM в ГБ
    core_fraction = 20 // Гарантированный процент использования процессорного времени
  }

  boot_disk { // Загрузочный диск, который будет использоваться для установки ОС для виртуалки
    initialize_params {
      image_id    = var.yc_image.ubuntu_20               // Идентификатор образа диска для установки лучше использовать из справочника
      description = "Загрузочный диск на базе Ubuntu 20" // Описание диска
      size        = 20                                   // Размер в ГБ
      type        = var.yc_disk_type.network_hdd         // Тип диска
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  service_account_id = yandex_iam_service_account.servitor.id

  metadata = {
    serial-port-enable = 1
    user-data = templatefile("./users.yml", {vm_user_name = var.vm_user_name, ssh_key = var.ssh_key})
  }
}

# Создание ресурса сети
resource "yandex_vpc_network" "network" {
  name = "network"
}

# Создание ресурса подсети
resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet"
  zone           = var.default_zone              # зона Яндекс.Облака, используемая для данной подсети
  network_id     = yandex_vpc_network.network.id # id сети, к которой принадлежит данная подсеть
  v4_cidr_blocks = ["192.168.10.0/24"]           # адрес подсети
}
