#!/usr/bin/bash
while [[ $# -gt 0 ]]; do
key="$1"
(case $key in
-p|--platform)
PLATFORM="$2"
shift
shift
;;
(-c|--command)
COMMAND="$2"
shift
shift
;;
deploy_pods() {
local namespace="$1"
for i in {1..4}; do
kubectl -n "$namespace" run pod-$i --image=nginx
done
kubectl wait --for=condition=ready pods -n "$namespace" --all
fi
}
create_communication() {
local source_namespace=$1
local target_namespace=$2
source_pod=$(kubectl get pods -n "$source_namespace" -o=jsonpath='{.items[0].metadata.name}')
target_pod=$(kubectl get pods -n "$target_namespace" -o=jsonpath='{.items[0].metadata.name}')
kubectl exec -n "$source_namespace" "$source_pod" -- sh -c "curl $target_pod"
if [ $? -ne 0 ]; then
echo "Error establishing communication between pods"
else
echo "Communication established between pods"
fi
}
kubectl create namespace namespace1
kubectl create namespace namespace2                                                                                                                                   deploy_pods namespace1
deploy_pods namespace2
kubectl wait --for=condition=ready pods -n namespace1 --all
kubectl wait --for=condition=ready pods -n namespace2 --all
create_communication namespace1 namespace2
echo "Communication established between pods"
