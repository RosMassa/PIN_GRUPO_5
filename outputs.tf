output "connect_to_zonal_cluster" {
  value = var.enable_private_endpoint ? "gcloud container clusters get-credentials ${var.gke_cluster_name} --zone ${var.zone} --project ${var.project_id} --internal-ip" : "gcloud container clusters get-credentials ${var.gke_cluster_name} --zone ${var.zone} --project ${var.project_id}"
}

output "create_iap_tunnel" {
  value = var.enable_private_endpoint ? "gcloud compute ssh ${google_compute_instance.iap-proxy[0].name} --zone ${var.zone} --project ${var.project_id} -- -L 8888:localhost:8888 -N -q -f" : "N/A"
}

output "enable_workload_identity_on_node_pool" {
  value = "gcloud container node-pools update ${var.gke_nodepool_name} --cluster ${var.gke_cluster_name} --workload-metadata=GKE_METADATA --zone ${var.zone} --project ${var.project_id}"
}
