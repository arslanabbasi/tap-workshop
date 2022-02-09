#!/bin/bash

set -x

k delete ns tap-demos-ui tap-demos-w01 tap-demos-w01-s001 tap-demos-w01-s002 tap-demos-w01-s003 tap-demos-w02

kapp delete -n tap-install -a tap-workshop --yes

kubectl delete -f additional-resources.yaml

