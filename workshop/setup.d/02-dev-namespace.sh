#!/bin/bash
set -x
set +e

#REGISTRY_PASSWORD=$HARBOR_PASSWORD kp secret create registry-credentials --registry harbor.${INGRESS_DOMAIN} --registry-user admin
#REGISTRY_PASSWORD=$HARBOR_PASSWORD kp secret create registry-credentials --registry 192.168.0.2:30003 --registry-user admin
#REGISTRY_PASSWORD="VMware1!" kp secret create registry-credentials --registry 192.168.0.2:30003 --registry-user admin

export REGISTRY_HOSTNAME="harbor.lab-harbor.com"
export REGISTRY_USERNAME="tap-hol"
export REGISTRY_PASSWORD="VMware1!"
#tanzu secret registry add registry-credentials --username ${REGISTRY_USERNAME} --password ${REGISTRY_PASSWORD} --server ${REGISTRY_HOSTNAME}
yes| kubectl delete secret registry-credentials
kubectl create secret docker-registry registry-credentials --docker-server=${REGISTRY_HOSTNAME} --docker-username=${REGISTRY_USERNAME} --docker-password=${REGISTRY_PASSWORD}