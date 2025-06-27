# ArgoCD with git-crypt

This is
a [build-your-own-image](https://argo-cd.readthedocs.io/en/stable/operator-manual/custom_tools/#byoi-build-your-own-image)
of [ArgoCD](https://argoproj.github.io/cd/) with [git-crypt](https://www.agwa.name/projects/git-crypt/) installed and
configured to automatically decrypt repositories.
This effectively enables *ArgoCD* users to store their secrets directly in git while not revealing them to strangers and
still using *ArgoCD* to deploy them.

## Supported ArgoCD Versions

The latest *ArgoCD* release is automatically rebuilt and published to the GitHub image registry.
However, this really **only includes the latest *ArgoCD* release**.
If you or your organisation need another version, you will have to build the image yourself or use one of the older
image tags if GitHub hasn't deleted it yet.

## Usage

1. This repository contains the source *Dockerfile* to build an image derived from `quay.io/argoproj/argocd`.
   You can either use the *Dockerfile* to build your own image or use the provided image
   from [`ghcr.io/lilioid/argocd-git-crypt`](https://github.com/lilioid/argocd-git-crypt/pkgs/container/argocd-git-crypt).

   This repository does not contain helm charts or other *ArgoCD* related manifests.
   This means that, in order to use this, you will have to follow the upstream *ArgoCD* instructions in order to deploy
   it but instead of using the normal image, you will have to use this repositories image instead for
   the `argocd-repo-server` deployment.

2. Additionally, you will need to configure *ArgoCD* a bit to allow *git-crypt* to work correctly.
   To do this, create a gpg secret key and provide it to *ArgoCD* inside its *gpg-keys* volume.
   The file must be named like the key fingerprint.
   On startup, *ArgoCD* will automatically load all key files (public and secret) from here into a keyring.

## Usage Example

An example deployment base on kustomize can be viewed inside the [example](./example) folder.
