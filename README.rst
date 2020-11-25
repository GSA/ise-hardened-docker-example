# ise-hardened-nginx

A nginx docker image hardened to GSA security requirements

## Table of Contents ##

* [Overview](#overview)
* [Hardening](#hardening)
* [Technologies](#technologies)
* [Architecture](#Architecture)
* [Setup](#setup)
* [Shared Library](#Shared Library)

## Overview

This repo refers to the hardened version of GSA's nginx Image. GSA's security settings are
applied to this image and provided as a base image to be used by other applications. A list of all the
currently implemented settings may be found in the scripts folder.

## Hardening

This image is hardened to GSA requirements. The list of settings can be found in the scripts folder.

## Technologies

* Docker
* Bash

## Architecture

Currently, this build is only for `AMD64` architectures.

## Setup

This image can be found on the GSA Repository. You can build it locally by cloning the repo and running:

```
$ docker build -t gsa-nginx .
```
