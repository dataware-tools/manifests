# Manifests
Kubernetes manifests for dataware-tools


## Directory structure
Contents in this repository are roughly categorised into the following directories.

| Directory | Purpose |
| --- | --- |
| `apps` | Dataware-tools' applications |
| `common` | Common components such as certificates, gateways and security policies |
| `contrib` | 3rd party applications |
| `distributions` | Bundles of manifests for individual distribution |


## Example deployment
You can deploy an example version of Dataware-tools using files under `distributions/demo` as follows:  
```bash
kustomize build distributions/demo | kubectl apply -f-

```
