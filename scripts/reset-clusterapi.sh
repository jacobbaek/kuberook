# https://github.com/kubernetes-sigs/cluster-api/issues/3836#issuecomment-713859559

clusterctl delete --all --include-crd --include-namespace

for crd in $(kubectl api-resources -o name | grep certmanager.k8s.io); do \
   for resource in $(kubectl get -A -o name $crd); do \
      echo "kubectl delete -A $resource"; \
   done && \
   echo "kubectl delete crd $crd"; \
done
kubectl delete crd certificaterequests.cert-manager.io
kubectl delete crd -A certificates.cert-manager.io
kubectl delete crd challenges.acme.cert-manager.io
kubectl delete crd clusterissuers.cert-manager.io
kubectl delete crd clusterresourcesetbindings.addons.cluster.x-k8s.io 
kubectl delete crd clusterresourcesets.addons.cluster.x-k8s.io
kubectl delete crd clusters.cluster.x-k8s.io
kubectl delete crd issuers.cert-manager.io
kubectl delete crd kubeadmconfigs.bootstrap.cluster.x-k8s.io
kubectl delete crd kubeadmconfigtemplates.bootstrap.cluster.x-k8s.io
kubectl delete crd kubeadmcontrolplanes.controlplane.cluster.x-k8s.io
kubectl delete crd machinedeployments.cluster.x-k8s.io
kubectl delete crd machinehealthchecks.cluster.x-k8s.io
kubectl delete crd machinepools.exp.cluster.x-k8s.io
kubectl delete crd machines.cluster.x-k8s.io
kubectl delete crd machinesets.cluster.x-k8s.io
kubectl delete crd orders.acme.cert-manager.io
kubectl delete crd providers.clusterctl.cluster.x-k8s.io
kubectl delete crd openstackclusters.infrastructure.cluster.x-k8s.io
kubectl delete crd openstackmachines.infrastructure.cluster.x-k8s.io
kubectl delete crd openstackmachinetemplates.infrastructure.cluster.x-k8s.io
kubectl delete apiservice/v1alpha3.infrastructure.cluster.x-k8s.io

#kubectl delete crd certificaterequests.certmanager.k8s.io
#kubectl delete -A certificate.certmanager.k8s.io/argocd-secret
#kubectl delete -A certificate.certmanager.k8s.io/alertmanager-tls
#kubectl delete -A certificate.certmanager.k8s.io/grafana-tls
#kubectl delete -A certificate.certmanager.k8s.io/prometheus-tls
#kubectl delete crd certificates.certmanager.k8s.io
#kubectl delete crd challenges.certmanager.k8s.io
#kubectl delete crd clusterissuers.certmanager.k8s.io
#kubectl delete crd issuers.certmanager.k8s.io
#kubectl delete crd orders.certmanager.k8s.io

kubectl delete -A ns/cert-manager ns/cert-manager-test
