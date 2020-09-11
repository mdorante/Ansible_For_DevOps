# Deploy a version-controlled app

These are only examples, I won't actually be running commands on the servers because I don't want to waste time setting up ssh keys for github and all that stuff.

Let's suppose I have an app running on my `app` servers, in the directory `/opt/myapp`. This directory is a git repo cloned from GitHub. App deployments are done by pushing updates to GitHub and running a script located at `opt/myapp/scripts/update.sh`

- Checkout tag 1.2.4
  - The `version` parameter can be used to checkout a branch, tag, or even a specific commit

```console
ansible app -b -m git -a "repo=git://github.com/mdorante/myapp.git dest=/opt/myapp update=yes version=1.2.4"
```

- Update the app with the `update.sh` script

```console
ansible app -b -a "/opt/myapp/scripts/update.sh"
```
