#!/bin/bash

cd /home/akash
if [ -f variables ]; then 
source /home/akash/variables

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

main() {

    wget -q --no-cache "https://raw.githubusercontent.com/javierxam/akashos/main/kubespray-bootstrap.sh"
    chmod +x kubespray-bootstrap.sh
    echo "No setup detected! Enter the default password 'akash' to start the Akash installer"
    sudo ./kubespray-bootstrap.sh
    if [[ $SETUP_COMPLETE == true ]]; then
            export KUBECONFIG=/home/akash/.kube/kubeconfig
            echo "Variables file detected - Setup complete."
        fi
        }

# Execute the main function
main
