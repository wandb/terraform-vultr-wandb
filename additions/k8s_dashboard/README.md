## Pre-requisites:
 * The kubernetes dashboard must be installed. (See ) The kubectl command should resemble `kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml`.
 * port forwarding to the service must be in place (something like `kubectl -n kubernetes-dashboard port-forward service/kubernetes-dashboard :443` should suffice once the dashboard manifest has been applied).

## Setup the k8s service account
Apply the `service-account.yaml` file with `kubectl` to create the service account.
Then apply the `cluster-role-binding.yaml` manifest.

## Retrieve the Auth Token
EXECUTE: `kubectl -n kubernetes-dashboard create token admin-user`

The token returned will be neded to login to the dashboard. 

