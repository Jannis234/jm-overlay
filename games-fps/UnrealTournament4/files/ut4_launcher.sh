#!/bin/sh

# UT4 writes its config/logs to $HOME/UnrealTournament
# Move them to a better location
export HOME="${HOME}/.local/share"
exec "./Engine/Binaries/Linux/UE4-Linux-Shipping" UnrealTournament "$@"

