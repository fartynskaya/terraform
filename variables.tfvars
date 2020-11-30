default_zone = "ru-central1-a"

# Спаравочники Yandex.Cloud
# ID образов дисков
yc_image = {
  debian_10 = "fd80iibe8asp4inkhuhr"
  centos_8  = "fd878e3sgmosqaquvef5"
  ubuntu_20 = "fd8vmcue7aajpmeo39kk"
  
}

# Типы дисков
yc_disk_type = {
  network_hdd               = "network-hdd"
  network_ssd               = "network-ssd"
  network_ssd_nonreplicated = "network-ssd-nonreplicated"
}

# Типы виртуалок
yc_vm_platform_type = {
  standard_1 = "standard-v1" // Intel Broadwell
}