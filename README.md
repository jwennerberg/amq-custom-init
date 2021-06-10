# AMQ Broker custom init container

This repository contains examples on how to build custom init container images for use with the AMQ Broker 7.8.x Operator.

### Build the container image in OpenShift

1. Create the required objects; `ConfigMap`, `ImageStream` and `BuildConfig`

```
oc project <namespace>
oc apply -f custom-init/manifests/configmap.yaml
oc apply -f custom-init/manifests/imagestream.yaml
oc apply -f custom-init/manigests/buildconfig.yaml
```

OR.. create everything in one go (including a namespace) with the help of `Kustomize`:

```
oc apply -k custom-init/manifests/
```

2. Verify the build is running

```
oc get builds -l build=amq-custom-init
```

Follow the build logs or wait for the status to be `Complete`

3. Verify that the image has been pushed to the internal registry

```
oc get imagestream amq-custom-init
```

If the image has been pushed correctly, the image reference can then be used with `initImage` in the AMQ Broker CR



