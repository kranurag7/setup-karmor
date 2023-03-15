#! /bin/bash

set -ex

echo "System: $(uname)"
echo "Architecture: $(uname -m)"

if [[ "$(uname)" == "Linux" ]]; then
    if [[ "$(uname -m)" == "x86_64" || "$(uname -m)" == "amd64" ]]; then
        gh release download -R kubearmor/kubearmor-client $karmor_version -p '*linux_amd64.tar.gz'
        ls -la
        tar -xvf karmor_*_linux_amd64.tar.gz -C /usr/local/bin
    else 
        gh release download -R kubearmor/kubearmor-client $karmor_version -p '*linux_arm64.tar.gz'
        tar -xvf karmor_*_linux_arm64.tar.gz -C /usr/local/bin
    fi
elif [[ "$(uname)" == "Darwin" ]]; then
    if [[ "$(uname -m)" == "x86_64" || "$(uname -m)" == "amd64" ]]; then
        gh release download -R kubearmor/kubearmor-client $karmor_version -p '*darwin_amd64.tar.gz'
        tar -xvf karmor_*_darwin_amd64.tar.gz -C /usr/local/bin
    else 
        gh release download -R kubearmor/kubearmor-client $karmor_version -p '*darwin_arm64.tar.gz'
        tar -xvf karmor_*_darwin_arm64.tar.gz -C /usr/local/bin
    fi
else
    echo "Unsupported operating system"
fi
