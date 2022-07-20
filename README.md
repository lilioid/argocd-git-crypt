# ArgoCD with git-crypt

This is a [build-your-own-image](https://argo-cd.readthedocs.io/en/stable/operator-manual/custom_tools/#byoi-build-your-own-image) of [ArgoCD](https://argoproj.github.io/cd/) with [git-crypt](https://www.agwa.name/projects/git-crypt/) installed and configured to automatically decrypt repositories.
This effectively enables *ArgoCD* users to store their secrets directly in git while not revealing them to strangers and still using *ArgoCD* to deploy them.

## Supported ArgoCD Versions

The latest *ArgoCD* release is automatically rebuilt and published to the GitHub image registry.
However, this really **only includes the latest *ArgoCD* release**.
If you or your organisation needs another version, you will have to build the image yourself or use one of the older image tags if GitHub hasn't deleted it yet.

<!--
## Usage

1. This repository contains the source *Dockerfile* to build an image derived from `quay.io/argoproj/argocd`.
   You can either use the *Dockerfile* to build your own image or use the provided image from [`ghcr.io/ftsell/argocd-git-crypt`](https://github.com/ftsell/argocd-kustomize-pass/pkgs/container/argocd-kustomize-pass).

   This repository does not contain helm charts or other *ArgoCD* related manifests.
   This means that, in order to use this, you will have to follow the upstream *ArgoCD* instructions in order to deploy it but instead of using the normal image, you will have to use this repositories image instead for the `argocd-repo-server` deployment.

2. Additionally, you will need to configure *ArgoCD* a bit to allow *kustomize-pass* to work correctly:
   1. Create a gpg secret key and provide it to *ArgoCD* inside its *gpg-keys* volume.
      The file must be named like the key fingerprint.
      On startup, *ArgoCD* will automatically load all key files (public and secret) from here into a keyring.
   2. Set the environment variable `XDG_DATA_HOME` to some place that *kustomize-pass* can write files.
      This is required because the *ArgoCD* manifests run the container with a read-only filesystem by default.
      A possible value would be `XDG_DATA_HOME=/tmp/data`.
   3. Se the environment variable `GNUPGHOME=/app/config/gpg/keys` because that is where *ArgoCD* accumulates all keys during startup.

### Usage Example

This project is used by [Viva con Agua](https://www.vivaconagua.org/) to deploy its *ArgoCD*.
You can view the deployment configuration at the [Viva-con-Agua/argocd-deploy](https://github.com/Viva-con-Agua/argocd-deploy) repository.
-->
