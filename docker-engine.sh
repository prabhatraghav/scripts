# Before you can install Docker Engine, you need to uninstall any conflicting packages
# command to uninstall all conflicting packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
