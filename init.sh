#!/bin/bash
#
# Script to initialize Ansible environment
#
# Usage: source init.sh
#

# Check if the path is corrent
[[ -f "./Pipfile" ]] || {
  echo "No Pipfile found."
  return
}

pipenv install

# Copy git hooks
cp .githooks/* .git/hooks/

BASE_ANSIBLE_REPO_PATH=$(pwd)
PATH=$BASE_ANSIBLE_REPO_PATH/.bin:$PATH

export PATH
# Can be used in lookup module when playbooks are in different folders
# Example usage:
# base_ansible_repo_path: "{{ lookup('env', 'BASE_ANSIBLE_REPO_PATH') }}"
# ssh_public_key: "{{ lookup('file', base_ansible_repo_path+'/ssh_keys/user.pub') }}"
export BASE_ANSIBLE_REPO_PATH

pipenv shell
