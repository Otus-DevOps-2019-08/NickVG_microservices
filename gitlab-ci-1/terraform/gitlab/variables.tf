variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable zone {
  description = "Zone"
}

variable app_disk_image {
  description = "Disk image for gitlab app"
  default     = "ubuntu-1604-xenial"
}
variable user {
  #Описание переменной
  description = "default user nick"
}
