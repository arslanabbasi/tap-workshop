#!/bin/bash
set -x
set +e

export REPO_NAME=$SESSION_NAMESPACE-$(date +%s)
echo $REPO_NAME > repo.txt

mkdir spring-sensors
cd spring-sensors
echo "# Spring Sensors Application" >> README.MD
git init
git checkout -b main
git config user.name gitea_admin
git config user.email "gitea_admin@example.com"
git add .
git commit -a -m "Initial Commit"

#git remote add origin http://gitea_admin:$GITEA_PASSWORD@gitea.${INGRESS_DOMAIN}/gitea_admin/$REPO_NAME.git
git remote add origin http://gitea_admin:$GITEA_PASSWORD@<gitea-url>/gitea_admin/$REPO_NAME.git
git push -u origin main
