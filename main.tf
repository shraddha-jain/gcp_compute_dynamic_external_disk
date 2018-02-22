resource "google_compute_instance" "gcp_compute_instance" {
  count        = "${var.count}"
  project      = "${var.project_id}"
  name         = "${var.inst_name}-${count.index}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
  boot_disk {
    initialize_params {
    image      = "${var.inst_image}"
    }
  }
  
  attached_disk  {
    source     = "${element(google_compute_disk.gcp_compute_disk.*.self_link,count.index)}"
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network    = "default"
    access_config {
    }
  }

  service_account {
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_disk" "gcp_compute_disk" {
  count    = "${var.count}"
  project  = "${var.project_id}"
  name     = "${var.disk_name}-${count.index}"
  type     = "${var.disk_type}"
  zone     = "${var.zone}"
  size     = "${var.pd_size}"
}
