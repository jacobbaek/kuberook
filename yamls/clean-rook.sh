#!/bin/bash

for node in {node1,node2,node3,node4};
do
    ssh $node rm -rf /var/lib/rook/*
    ssh $node rm -rf /var/lib/kubelet/plugin/rook-ceph*
done
