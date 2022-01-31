helm repo add gitea-charts https://dl.gitea.io/charts/
helm repo update

ytt -f /home/holuser/tap-workshop/install/gitea/gitea-helm-values.yaml -f $1 \
  | helm install gitea-charts/gitea --name-template gitea -n gitea -f-

ytt -f /home/holuser/tap-workshop/install/gitea/gitea-dependencies.yaml -f $1 --ignore-unknown-comments \
  | kubectl apply -f-
