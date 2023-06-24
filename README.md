# Silverybluish

[![build-oci](https://github.com/stusmi/silverybluish/actions/workflows/build.yml/badge.svg)](https://github.com/stusmi/silverybluish/actions/workflows/build.yml)

A custom Fedora Silverblue image based on the great work done in [Universal Blue](https://ublue.it)

## What is this?

This is a custom image of Fedora Silverblue. It's based on the work of the silverblue-main image from [ublue-os](https://github.com/ublue-os/main) with a few changes for my own needs. If you're looking to build your own custom image, you'd be best served by heading over to [Universal Blue](https://ublue.it), taking a look at their work and following their community.


Check out the [spec for Fedora](https://fedoraproject.org/wiki/Changes/OstreeNativeContainerStable) for more information and proper explanation.

## Installation

To rebase an existing Silverblue/Kinoite installation to the current build:

```
sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/stusmi/silverybluish:38
```

This repository builds date tags as well, so if you want to rebase to a particular day's build:

```
sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/stusmi/silverybluish:20221217
```


## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/stusmi/silverybluish


