# Silverybluish

[![build-oci](https://github.com/stusmi/silverybluish/actions/workflows/build.yml/badge.svg)](https://github.com/stusmi/silverybluish/actions/workflows/build.yml)

A custom Fedora Silverblue image based on the great work done in [Universal Blue](https://ublue.it)

## What is this?

This is a custom image of Fedora Silverblue. It builds on the silverblue-main image from [ublue-os](https://github.com/ublue-os/main). If you're looking to build your own custom image, you'd be best served by heading over to [Universal Blue](https://ublue.it), taking a look at their work and following their community.

```mermaid
flowchart LR
    A(Fedora Silverblue\n) --> B(uBlue silverblue-main)
    B --> C(Silverybluish)
```

Check out the [spec for Fedora](https://fedoraproject.org/wiki/Changes/OstreeNativeContainerStable) for more information and proper explanation.

## Installation

> **Warning**
> This is an experimental feature and should not be used in production, try it in a VM for a while! If you are rebasing and not doing a clean install do a `touch ~/.config/silverybluish/firstboot-done` to keep your flatpak configuration untouched BEFORE you rebase, otherwise we're going to mangle it (for science).

To rebase an existing Silverblue/Kinoite installation to the latest build:

```
sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/stusmi/silverybluish:latest
```

This repository builds date tags as well, so if you want to rebase to a particular day's build:

```
sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/stusmi/silverybluish:20221217
```

The `latest` tag will automatically point to the latest build. Note that when a new version of Fedora is released that the `latest` tag will get updated to that latest release automatically.

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/stusmi/silverybluish


