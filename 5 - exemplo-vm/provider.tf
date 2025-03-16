provider "google" {
  project = "zup"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = file("${path.module}/../keys/sonorous-pact-451318-e2-ebcceee755a4.json")
}
