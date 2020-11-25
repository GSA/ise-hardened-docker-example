#!/bin/sh
# This ensures that certain packages are not on the base image
PACKAGE=openssh-server
    if ! dpkg-query --show | grep -w $PACKAGE; then
        echo "Already Patched"
    else
        echo "Removing Package"
        dpkg -r $PACKAGE
        dpkg -P $PACKAGE
    fi

PACKAGE=ncat
    if ! dpkg-query --show | grep -w $PACKAGE; then
        echo "Already Patched"
    else
        echo "Removing Package"
        dpkg -r $PACKAGE
        dpkg -P $PACKAGE
    fi

PACKAGE=wget
    if ! dpkg-query --show | grep -w $PACKAGE; then
        echo "Already Patched"
    else
        echo "Removing Package"
        dpkg -r $PACKAGE
        dpkg -P $PACKAGE
    fi

PACKAGE=curl
    if ! dpkg-query --show | grep -w $PACKAGE; then
        echo "Already Patched"
    else
        echo "Removing Package"
        dpkg -r $PACKAGE
        dpkg -P $PACKAGE
    fi

PACKAGE=git
    if ! dpkg -l git; then
        echo "Already Patched"
    else
        echo "Removing Package"
        apt-get remove git
        apt-get autoremove
    fi
