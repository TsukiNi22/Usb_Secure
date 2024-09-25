#!/bin/bash

# Récupérer la session de l'utilisateur
session=$(loginctl | grep 'UserName' | awk '{print $1;}')

if [ "$1" == "lock" ]; then
    # Verrouiller la session et mettre en veille
    loginctl lock-session ${session}
    systemctl suspend
fi
