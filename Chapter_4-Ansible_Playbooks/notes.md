# Chapter 4 - Ansible Playbooks

## Transcribing a Shell Script into an Ansible Playbook

In this part we have an example shell script that installs, configures and enables Apache.

We will transcribe it into a simple Ansible Playbook and then we will upgrade the playbook to make better use of Ansible's features (idempotence, modules, etc.)

The script copies some apache config files to their desired locations. We have the files in our **_local machine_**, but for the shell script, we transfer the files over to the server and we put them in `/tmp/`.

This is not necessary in the revised Ansible Playbook, because we use the `copy` module.

## Real-world playbook: CentOS Node.js app server

In this example, we will configure a CentOS server with Node.js, and install and start a simple Node.js app.
