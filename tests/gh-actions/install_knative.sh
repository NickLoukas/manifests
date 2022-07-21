#!/bin/bash
set -euo pipefail
echo "Installing KNative ..."
set +e
kustomize build common/knative/knative-serving/overlays/gateways | kubectl apply -f -
set -e
echo "Waiting for validatingwebhookconfiguration.admissionregistration.k8s.io/validation.webhook.serving.knative.dev to be available ..."
kubectl wait --for condition=established --timeout=30s validatingwebhookconfiguration.admissionregistration.k8s.io/validation.webhook.serving.knative.dev
kustomize build common/knative/knative-serving/overlays/gateways | kubectl apply -f -
kustomize build common/knative/knative-eventing/base | kubectl apply -f -
kustomize build common/istio-1-14/kubeflow-istio-resources/base | kubectl apply -f -
sleep 60