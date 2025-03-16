resource "google_compute_network" "main" {
  name                    = var.gcp_network_name
  auto_create_subnetworks = true
}
