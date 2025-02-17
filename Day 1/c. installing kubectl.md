

https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/


1. curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

2. validate binary - curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
   echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

3. Install kubectl - sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

4. An imp thing to note here is that, the kubectl version is v1.32.2, while the KB version which is running on server is reported next, currently we dont have KB cluster setup, hence it returns localhost:8008 refused.

Client Version: v1.32.2
Kustomize Version: v5.5.0
The connection to the server localhost:8080 was refused - did you specify the right host or port?

