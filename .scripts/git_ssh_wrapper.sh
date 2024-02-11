#!/bin/bash

# Get the email from the local git config
REPO_EMAIL=$(git config user.email)

# Determine which SSH key to use based on the email
if [[ "$REPO_EMAIL" == "gonzalesalec@gmail.com" ]]; then
  SSH_KEY=~/.ssh/id_ed25519_personal
elif [[ "$REPO_EMAIL" == "alec@astraapplications.com" ]]; then
  SSH_KEY=~/.ssh/id_ed25519_work
else
  echo "No matching SSH key found for email: $REPO_EMAIL"
  exit 1
fi

# Execute the SSH command using the selected key
exec ssh -i "$SSH_KEY" "$@"
