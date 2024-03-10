## https://kubectl.docs.kubernetes.io/installation/kustomize/
## https://kubectl.docs.kubernetes.io/guides/introduction/kustomize/
## https://kubectl.docs.kubernetes.io/installation/kustomize/binaries/
## The following script detects your OS and downloads the appropriate kustomize binary to your current working directory
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

# Kustomize lets you customize raw, template-free YAML files for multiple purposes, leaving the original YAML untouched and usable as is.
# Kustomize targets kubernetes; it understands and can patch kubernetes style API objects. It’s like make, in that what it does is declared in a file, and it’s like sed, in that it emits edited text.

# Example of kustomize for google/cAdvisor as k8s DaemonSet deployment.
# Example: https://github.com/prabhatraghav/cadvisor_by_google/tree/master/deploy/kubernetes/base
