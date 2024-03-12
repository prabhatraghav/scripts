# APT/YUM repository for Grafana stable releases
    https://apt.grafana.com/

https://grafana.com/docs/grafana/latest/setup-grafana/installation/debian/

# FOR apt package manager - Debian/Ubuntu 
    sudo apt-get install -y apt-transport-https software-properties-common wget
    sudo mkdir -p /etc/apt/keyrings/
    wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
    echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
    echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com beta main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
    sudo apt-get update

Installs the latest Grafana OSS release:

    sudo apt-get install grafana

Installs the latest Grafana Enterprise release:

    sudo apt-get install grafana-enterprise















