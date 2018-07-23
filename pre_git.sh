#!/bin/sh

if [ ! -z "$NoStrictHostKeyChecking" ]
then
    echo "Skipping StrictHostKeyChecking"
    mkdir -p $HOME/.ssh
    echo "Host *" > $HOME/.ssh/config
    echo "   StrictHostKeyChecking=no" >> $HOME/.ssh/config
    echo "   IdentityFile=$HOME/.ssh/id_rsa"  >> $HOME/.ssh/config
else
    echo "... :("
fi

if [ ! -z "$SSH_IDENTITY" ]
then
    echo "Setting ssh identity"
    mkdir -p $HOME/.ssh
    echo "$SSH_IDENTITY" > $HOME/.ssh/id_rsa
    chmod 600 $HOME/.ssh/id_rsa
fi

git "$@"