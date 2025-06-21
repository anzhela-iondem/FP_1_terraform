resource "local_file" "kubeconfig" {
  filename = "${path.module}/kubeconfig.yaml"

  content = <<EOF
apiVersion: v1
kind: Config
clusters:
- cluster:
    server: ${module.eks.cluster_endpoint}
    certificate-authority-data: ${module.eks.cluster_certificate_authority_data}
  name: ${module.eks.cluster_name}
contexts:
- context:
    cluster: ${module.eks.cluster_name}
    user: aws
  name: ${module.eks.cluster_name}
current-context: ${module.eks.cluster_name}
users:
- name: aws
  user:
    exec:
      apiVersion: "client.authentication.k8s.io/v1beta1"
      command: "aws"
      args:
        - "eks"
        - "get-token"
        - "--cluster-name"
        - "${module.eks.cluster_name}"
EOF
}