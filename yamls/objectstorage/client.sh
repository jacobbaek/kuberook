
# send request to k8s with cURL
curl -X GET $APISERVER/apis/ceph.rook.io/v1/namespaces/rook-ceph/cephclusters/rook-ceph --header "Authorization: Bearer $TOKEN" --insecure | jq
