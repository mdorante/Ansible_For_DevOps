# Manage Files and Directories

- Check out file stats

```console
❯ ansible multi -m stat -a "path=/etc/environment"
192.168.100.10 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "stat": {
        "atime": 1599577397.3176594,
        "attr_flags": "",
        "attributes": [],
        "block_size": 4096,
        "blocks": 0,
        "charset": "binary",
        "checksum": "da39a3ee5e6b4b0d3255bfef95601890afd80709",
        "ctime": 1588284305.321,
        "dev": 2049,
        "device_type": 0,
        "executable": false,
        "exists": true,
        "gid": 0,
        "gr_name": "root",
        "inode": 561,
        "isblk": false,
        "ischr": false,
        "isdir": false,
        "isfifo": false,
        "isgid": false,
        "islnk": false,
        "isreg": true,
        "issock": false,
        "isuid": false,
        "mimetype": "inode/x-empty",
        "mode": "0644",
        "mtime": 1585715373.0,
        "nlink": 1,
        "path": "/etc/environment",
        "pw_name": "root",
        "readable": true,
        "rgrp": true,
        "roth": true,
        "rusr": true,
        "size": 0,
        "uid": 0,
        "version": "18446744071705164100",
        "wgrp": false,
        "woth": false,
        "writeable": false,
        "wusr": true,
        "xgrp": false,
        "xoth": false,
        "xusr": false
    }
}
192.168.100.11 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "stat": {
        "atime": 1599577418.221639,
        "attr_flags": "",
        "attributes": [],
        "block_size": 4096,
        "blocks": 0,
        "charset": "binary",
        "checksum": "da39a3ee5e6b4b0d3255bfef95601890afd80709",
        "ctime": 1588284305.321,
        "dev": 2049,
        "device_type": 0,
        "executable": false,
        "exists": true,
        "gid": 0,
        "gr_name": "root",
        "inode": 561,
        "isblk": false,
        "ischr": false,
        "isdir": false,
        "isfifo": false,
        "isgid": false,
        "islnk": false,
        "isreg": true,
        "issock": false,
        "isuid": false,
        "mimetype": "inode/x-empty",
        "mode": "0644",
        "mtime": 1585715373.0,
        "nlink": 1,
        "path": "/etc/environment",
        "pw_name": "root",
        "readable": true,
        "rgrp": true,
        "roth": true,
        "rusr": true,
        "size": 0,
        "uid": 0,
        "version": "18446744071705164100",
        "wgrp": false,
        "woth": false,
        "writeable": false,
        "wusr": true,
        "xgrp": false,
        "xoth": false,
        "xusr": false
    }
}
192.168.100.12 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "stat": {
        "atime": 1599577440.0751424,
        "attr_flags": "",
        "attributes": [],
        "block_size": 4096,
        "blocks": 0,
        "charset": "binary",
        "checksum": "da39a3ee5e6b4b0d3255bfef95601890afd80709",
        "ctime": 1588284305.321,
        "dev": 2049,
        "device_type": 0,
        "executable": false,
        "exists": true,
        "gid": 0,
        "gr_name": "root",
        "inode": 561,
        "isblk": false,
        "ischr": false,
        "isdir": false,
        "isfifo": false,
        "isgid": false,
        "islnk": false,
        "isreg": true,
        "issock": false,
        "isuid": false,
        "mimetype": "inode/x-empty",
        "mode": "0644",
        "mtime": 1585715373.0,
        "nlink": 1,
        "path": "/etc/environment",
        "pw_name": "root",
        "readable": true,
        "rgrp": true,
        "roth": true,
        "rusr": true,
        "size": 0,
        "uid": 0,
        "version": "18446744071705164100",
        "wgrp": false,
        "woth": false,
        "writeable": false,
        "wusr": true,
        "xgrp": false,
        "xoth": false,
        "xusr": false
    }
}
```

- Copy a file to the servers

```console
❯ ansible multi -m copy -a "src=/etc/hosts dest=/tmp/hosts"
[WARNING]: File '/tmp/hosts' created with default permissions '600'. The previous default was '666'. Specify 'mode' to avoid this warning.
192.168.100.11 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "checksum": "44cdbefd0344c0970bf4e68c06d290867f549c51",
    "dest": "/tmp/hosts",
    "gid": 1000,
    "group": "vagrant",
    "md5sum": "c59fb63d70a5614ac66214fe522ac59c",
    "mode": "0600",
    "owner": "vagrant",
    "secontext": "unconfined_u:object_r:user_home_t:s0",
    "size": 365,
    "src": "/home/vagrant/.ansible/tmp/ansible-tmp-1599590296.057927-11847-26037836414350/source",
    "state": "file",
    "uid": 1000
}
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "checksum": "44cdbefd0344c0970bf4e68c06d290867f549c51",
    "dest": "/tmp/hosts",
    "gid": 1000,
    "group": "vagrant",
    "md5sum": "c59fb63d70a5614ac66214fe522ac59c",
    "mode": "0600",
    "owner": "vagrant",
    "secontext": "unconfined_u:object_r:user_home_t:s0",
    "size": 365,
    "src": "/home/vagrant/.ansible/tmp/ansible-tmp-1599590296.074976-11845-267261549255947/source",
    "state": "file",
    "uid": 1000
}
192.168.100.12 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "checksum": "44cdbefd0344c0970bf4e68c06d290867f549c51",
    "dest": "/tmp/hosts",
    "gid": 1000,
    "group": "vagrant",
    "md5sum": "c59fb63d70a5614ac66214fe522ac59c",
    "mode": "0600",
    "owner": "vagrant",
    "secontext": "unconfined_u:object_r:user_home_t:s0",
    "size": 365,
    "src": "/home/vagrant/.ansible/tmp/ansible-tmp-1599590296.08081-11849-17989699328768/source",
    "state": "file",
    "uid": 1000
}
```

- Retrieve a file from the servers

```console
❯ ansible multi -m copy -a "src=/etc/hosts dest=/tmp"
192.168.100.10 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "checksum": "44cdbefd0344c0970bf4e68c06d290867f549c51",
    "dest": "/tmp/hosts",
    "gid": 1000,
    "group": "vagrant",
    "mode": "0600",
    "owner": "vagrant",
    "path": "/tmp/hosts",
    "secontext": "unconfined_u:object_r:user_home_t:s0",
    "size": 365,
    "state": "file",
    "uid": 1000
}
192.168.100.11 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "checksum": "44cdbefd0344c0970bf4e68c06d290867f549c51",
    "dest": "/tmp/hosts",
    "gid": 1000,
    "group": "vagrant",
    "mode": "0600",
    "owner": "vagrant",
    "path": "/tmp/hosts",
    "secontext": "unconfined_u:object_r:user_home_t:s0",
    "size": 365,
    "state": "file",
    "uid": 1000
}
192.168.100.12 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "checksum": "44cdbefd0344c0970bf4e68c06d290867f549c51",
    "dest": "/tmp/hosts",
    "gid": 1000,
    "group": "vagrant",
    "mode": "0600",
    "owner": "vagrant",
    "path": "/tmp/hosts",
    "secontext": "unconfined_u:object_r:user_home_t:s0",
    "size": 365,
    "state": "file",
    "uid": 1000
}
```

## Create Files and Directories

- Create a directory

```console
❯ ansible multi -m file -a "dest=/tmp/test mode=644 state=directory"
192.168.100.12 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "gid": 1000,
    "group": "vagrant",
    "mode": "0644",
    "owner": "vagrant",
    "path": "/tmp/test",
    "secontext": "unconfined_u:object_r:user_tmp_t:s0",
    "size": 6,
    "state": "directory",
    "uid": 1000
}
192.168.100.11 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "gid": 1000,
    "group": "vagrant",
    "mode": "0644",
    "owner": "vagrant",
    "path": "/tmp/test",
    "secontext": "unconfined_u:object_r:user_tmp_t:s0",
    "size": 6,
    "state": "directory",
    "uid": 1000
}
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "gid": 1000,
    "group": "vagrant",
    "mode": "0644",
    "owner": "vagrant",
    "path": "/tmp/test",
    "secontext": "unconfined_u:object_r:user_tmp_t:s0",
    "size": 6,
    "state": "directory",
    "uid": 1000
}
```

- Create a symlink

```console
❯ ansible multi -m file -a "src=/home/vagrant/.bash_profile dest=/tmp/symlink.txt state=link"
192.168.100.11 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "dest": "/tmp/symlink.txt",
    "gid": 1000,
    "group": "vagrant",
    "mode": "0777",
    "owner": "vagrant",
    "secontext": "unconfined_u:object_r:user_tmp_t:s0",
    "size": 27,
    "src": "/home/vagrant/.bash_profile",
    "state": "link",
    "uid": 1000
}
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "dest": "/tmp/symlink.txt",
    "gid": 1000,
    "group": "vagrant",
    "mode": "0777",
    "owner": "vagrant",
    "secontext": "unconfined_u:object_r:user_tmp_t:s0",
    "size": 27,
    "src": "/home/vagrant/.bash_profile",
    "state": "link",
    "uid": 1000
}
192.168.100.12 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "dest": "/tmp/symlink.txt",
    "gid": 1000,
    "group": "vagrant",
    "mode": "0777",
    "owner": "vagrant",
    "secontext": "unconfined_u:object_r:user_tmp_t:s0",
    "size": 27,
    "src": "/home/vagrant/.bash_profile",
    "state": "link",
    "uid": 1000
}
```

## Delete Files and Directories

- Delete a file, directory, symlink, etc.

```console
❯ ansible multi -m file -a "path=/tmp/test state=absent"
192.168.100.12 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "path": "/tmp/test",
    "state": "absent"
}
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "path": "/tmp/test",
    "state": "absent"
}
192.168.100.11 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "path": "/tmp/test",
    "state": "absent"
}
```
