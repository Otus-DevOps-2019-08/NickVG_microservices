resource "google_compute_instance" "app" {
  name         = "gitlab"
  machine_type = "g1-standard-1"
  zone         = var.zone
  tags         = ["http-server"]

  boot_disk {
    initialize_params { image = var.app_disk_image }
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.app_ip.address
    }
  }
  metadata = {
    ssh-keys = "${var.user}:${file(var.public_key_path)}"
  }
}
resource "google_compute_address" "app_ip" {
  name = "gitlab-ip"
}
