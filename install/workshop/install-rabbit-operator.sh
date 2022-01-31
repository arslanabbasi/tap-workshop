#kapp -y deploy --app rmq-operator --file https://github.com/rabbitmq/cluster-operator/releases/download/v1.10.0/cluster-operator.yml
wget https://github.com/rabbitmq/cluster-operator/releases/download/v1.10.0/cluster-operator.yml
sed -i "s/image: rabbitmqoperator\/cluster-operator:1.10.0/image: harbor-repo.vmware.com\/dockerhub-proxy-cache\/rabbitmqoperator\/cluster-operator:1.10.0/g" /home/holuser/tap-workshop/install/workshop/cluster-operator.yml
kapp -y deploy --app rmq-operator --file cluster-operator.yml
kubectl apply -f - << EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: resource-claims-rmq
  labels:
    services.vmware.tanzu.com/aggregate-to-resource-claims: "true"
rules:
- apiGroups: ["rabbitmq.com"]
  resources: ["rabbitmqclusters"]
  verbs: ["get", "list", "watch"]
EOF
