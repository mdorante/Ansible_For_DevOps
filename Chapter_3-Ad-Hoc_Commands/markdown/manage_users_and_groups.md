# Manage Users and Groups

- Add an `admin` group on the `app` servers for SysAdmins

```console
❯ ansible app -b -m group -a "name=admin state=present"
192.168.100.11 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "gid": 1001,
    "name": "admin",
    "state": "present",
    "system": false
}
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "gid": 1001,
    "name": "admin",
    "state": "present",
    "system": false
}
```

- Add the user `johndoe` and create a home folder for the user

```console
❯ ansible app -b -m user -a "name=johndoe group=admin state=present createhome=yes"
192.168.100.11 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "comment": "",
    "create_home": true,
    "group": 1001,
    "home": "/home/johndoe",
    "name": "johndoe",
    "shell": "/bin/bash",
    "state": "present",
    "system": false,
    "uid": 1001
}
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "comment": "",
    "create_home": true,
    "group": 1001,
    "home": "/home/johndoe",
    "name": "johndoe",
    "shell": "/bin/bash",
    "state": "present",
    "system": false,
    "uid": 1001
}
```

- Delete the account

```console
❯ ansible app -b -m user -a "name=johndoe state=absent remove=yes"
192.168.100.11 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "force": false,
    "name": "johndoe",
    "remove": true,
    "state": "absent"
}
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "force": false,
    "name": "johndoe",
    "remove": true,
    "state": "absent"
}
```
