#!/bin/bash

cd /home/akash
if [ -f variables ]; then 
source /home/akash/variables

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

cleanup_bootstrap() {
    if [ -f ./*bootstrap.sh ]; then
        echo "Found old installers - cleaning up"
        rm ./kubespray-bootstrap.sh 2>/dev/null
    fi
}

main() {
    cleanup_bootstrap
    if [ ! -f variables ]; then
        while true; do
            echo -p "Installing kubespray" method
            wget -q --no-cache "https://raw.githubusercontent.com/javierxam/akashos/main/kubespray-bootstrap.sh"
            chmod +x "kubespray-bootstrap.sh"
            echo "No setup detected! Enter the default password 'akash' to start the Akash installer"
            sudo "./kubespray-bootstrap.sh"
            
        done
    else
        source variables
        if [[ $SETUP_COMPLETE == true ]]; then
            export KUBECONFIG=/home/akash/.kube/kubeconfig
            echo "Variables file detected - Setup complete."
        fi
    fi
}

# Execute the main function
main
