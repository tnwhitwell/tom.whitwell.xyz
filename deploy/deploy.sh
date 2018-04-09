#!/usr/bin/env bash
REG=${1}
TAG=${2}
NS=${3}
URL=${4}
export REGISTRY=${REG}
export BUILD_NUMBER=${TAG}
export NAMESPACE=${NS}
export ENV_URL=${URL}
for f in templates/*.yml
do
 envsubst < $f > “.generated/$(basename $f)”
done
kubectl apply -f .generated/