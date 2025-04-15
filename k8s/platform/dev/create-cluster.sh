#!/bin/sh

############################ Start Kubernetes cluster  ##################################
echo "\n📦 Initializing Kubernetes cluster...\n"

minikube start --cpus 2 --memory 4g --driver docker --profile x1

############################  Ingress Controller  ##################################

echo "\n🔌 Enabling NGINX Ingress Controller...\n"

minikube addons enable ingress --profile x1


sleep 5


############################  Keycloak  ##################################

echo "\n📦 Deploying Keycloak..."

kubectl apply -f services/keycloak-config.yml
kubectl apply -f services/keycloak.yml

sleep 5

echo "\n⌛ Waiting for Keycloak to be deployed..."

while [ $(kubectl get pod -l app=x1-keycloak | wc -l) -eq 0 ] ; do
  sleep 5
done

echo "\n⌛ Waiting for Keycloak to be ready..."

kubectl wait \
  --for=condition=ready pod \
  --selector=app=polar-keycloak \
  --timeout=300s

echo "\n⌛ Ensuring Keycloak Ingress is created..."

kubectl apply -f services/keycloak.yml


############################  Registry  ##################################

echo "\n🔌 Enabling Registry-creds...\n"

minikube addons enable registry-creds --profile x1

sleep 5

##############################  Postgresql ##################################
echo "\n📦 Deploying PostgreSQL..."

kubectl apply -f services/postgresql.yml

sleep 5

echo "\n⌛ Waiting for PostgreSQL to be deployed..."

while [ $(kubectl get pod -l db=x1-postgres | wc -l) -eq 0 ] ; do
  sleep 5
done

echo "\n⌛ Waiting for PostgreSQL to be ready..."

kubectl wait \
  --for=condition=ready pod \
  --selector=db=x1-postgres \
  --timeout=180s

echo "\n📦 Deploying RabbitMQ..."

kubectl apply -f services/rabbitmq.yml

sleep 5

echo "\n⌛ Waiting for RabbitMQ to be deployed..."

while [ $(kubectl get pod -l db=x1-rabbitmq | wc -l) -eq 0 ] ; do
  sleep 5
done

echo "\n⌛ Waiting for RabbitMQ to be ready..."

kubectl wait \
  --for=condition=ready pod \
  --selector=db=x1-rabbitmq \
  --timeout=180s
