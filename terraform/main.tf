provider "google" {
  version = "1.4.0"
  project = "infra-221016"
  region = "europe-west1"
}

resource "google_compute_instance" "app" {
  name = "reddit-app"
  machine_type = "g1-small"
  zone = "europe-west1-b"
  tags = ["reddit-app"]
  boot_disk {
    initialize_params {
      image = "reddit-base"
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
  metadata {
    ssh-keys = "otus:${file("~/.ssh/otus.pub")}"
  } 
  connection {
    type = "ssh"
    user = "otus"
    agent = false
    private_key = "${file("~/.ssh/otus")}"
  }
  provisioner "file" {
    source = "files/puma.service"
    destination = "/tmp/puma.service"
  } 
  provisioner "remote-exec" {
    script = "files/deploy.sh"
  } 
} 

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["9292"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["reddit-app"]
} 
