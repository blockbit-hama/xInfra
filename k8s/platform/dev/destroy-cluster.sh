#!/bin/sh

echo "\n🏴️ Destroying Kubernetes cluster...\n"

minikube stop --profile x1

minikube delete --profile x1

echo "\n🏴️ Cluster destroyed\n"
