#!/bin/bash

for node in {node1,node2,node3,node4};
do
    ssh $node rm -rf /var/lib/rook/*
    ssh $node rm -rf /var/lib/kubelet/plugins/rook-ceph*
    ssh $node rm -rf /var/lib/kubelet/plugins_registry/rook-ceph*
    echo "delete rook-ceph files in "$node
done

for pod in `kubectl get secret -n rook-ceph -o name`;
do
    kubectl delete $pod -n rook-ceph
done
