
## Why a service account is needed

A pod should always be assigned to a service account, whether pod is deployed as deployment, daemon set or stateful set.

### What is a service account 

We have generally 2 things

- User account - The user has a kubeconfig file which it uses to connect to kb cluster using kubectl. So for a devops eng, QA, developer, if they want access to KB cluster or kb user interface, then we need to create a user account for them.

- Service account - When you want to deploy a POD to kb, the pod being a ms or application, for this ms to run on KB, it should have a service account. As user requires permission to do something on KB, similarly service also requires permissions do something on KB. This permission comes via service account.

KB has a default SA in every ns. Incase you dont assign your pod a S.A, KB will assign a defaul SA to pod, and the pod will run with defaul permissions. If kb did not assign a default SA to your pod, then KB will fail with error saying, no SA attached to pod.

Run `kubectl get sa`

```
kubectl get sa
NAME      SECRETS   AGE
default   0         83m

```

`kubectl get sa -n kube-system`
```
default                                       0         84m
```

Now suppose if your pod requires permission like being able to talk to configmap, KB api server, then we need to create a SA which is assigned a role which has necessary permission and using role binding, you will bind the SA to role.

#### Whats the need of SERVICE ACCOUNT

If a service in KB wants to access the api server, then it needs a service account with permissions. Just like similar to how a user need permission via user account. Otherwise the default SA has permissin just to run the pod in ns in which user has asked.

If you want to add more permission to your KB pod, your SA needs elevated permission, for that we create a Role/cluster role in KB, and attach this role to your service account

Similar to IAM role concept. roles needs permission, so similar for Service account.

