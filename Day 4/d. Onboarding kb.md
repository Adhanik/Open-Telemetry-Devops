

- Local KB (Dev Env) - minikube, kind, k3s, k3d - For local devlopment
- VM - kubeadm, kops - These are self managed KB cluster
- Managed KB - EKS, AKD, GKE, managed rancher, managed Openshift


With managed KB, upgrades are easier to do. cloud provider maintain your control plane and data plane, scaling is easy and you get UI as well



We will be making use of TF to create our KB cluster