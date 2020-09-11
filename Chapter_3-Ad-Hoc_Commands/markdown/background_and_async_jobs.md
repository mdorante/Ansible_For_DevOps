# Backgroung and Async Jobs

## Run operations in the background

Options:

- `-B <seconds>`: the maximum amount of time (in seconds) to let the job run
- `-P <seconds>`: the amount of time (in seconds) to wait between polling the servers for job status updates

## Asynchronous jobs

- Asynchronously update all packages on all servers

```console
❯ ansible multi -b -B 3600 -P 0 -a "yum -y update"
192.168.100.12 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "ansible_job_id": "995108558429.2328",
    "changed": true,
    "finished": 0,
    "results_file": "/root/.ansible_async/995108558429.2328",
    "started": 1
}
192.168.100.11 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "ansible_job_id": "837791159993.2098",
    "changed": true,
    "finished": 0,
    "results_file": "/root/.ansible_async/837791159993.2098",
    "started": 1
}
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "ansible_job_id": "943916355049.2087",
    "changed": true,
    "finished": 0,
    "results_file": "/root/.ansible_async/943916355049.2087",
    "started": 1
}
```

- Check the status of an async task (you must pass the jid of the task into the command)

```console
❯ ansible multi -b -m async_status -a "jid=943916355049.2087"
192.168.100.11 | FAILED! => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "ansible_job_id": "943916355049.2087",
    "changed": false,
    "finished": 1,
    "msg": "could not find job",
    "started": 1
}
192.168.100.12 | FAILED! => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "ansible_job_id": "943916355049.2087",
    "changed": false,
    "finished": 1,
    "msg": "could not find job",
    "started": 1
}
192.168.100.10 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "ansible_job_id": "943916355049.2087",
    "changed": false,
    "finished": 0,
    "started": 1
}
```

- Checking the status again

```console
❯ ansible multi -b -m async_status -a "jid=943916355049.2087"
[WARNING]: Consider using the yum module rather than running 'yum'.  If you need to use command because yum is insufficient you can add 'warn: false' to this command task or set
'command_warnings=False' in ansible.cfg to get rid of this message.
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "ansible_job_id": "943916355049.2087",
    "changed": true,
    "cmd": [
        "yum",
        "-y",
        "update"
    ],
    "delta": "0:02:48.024270",
    "end": "2020-09-09 16:34:30.311578",
    "finished": 1,
    "rc": 0,
    "start": "2020-09-09 16:31:42.287308",
    "stderr": "http://mirror.netglobalis.net/centos/7.8.2003/updates/x86_64/Packages/dbus-1.10.24-14.el7_8.x86_64.rpm: [Errno 12] Timeout on http://mirror.netglobalis.net/centos/7.8.2003/updates/x86_64/Packages/dbus-1.10.24-14.el7_8.x86_64.rpm: (28, 'Operation too slow. Less than 1000 bytes/sec transferred the last 30 seconds')\nTrying other mirror.",
    "stderr_lines": [
        "http://mirror.netglobalis.net/centos/7.8.2003/updates/x86_64/Packages/dbus-1.10.24-14.el7_8.x86_64.rpm: [Errno 12] Timeout on http://mirror.netglobalis.net/centos/7.8.2003/updates/x86_64/Packages/dbus-1.10.24-14.el7_8.x86_64.rpm: (28, 'Operation too slow. Less than 1000 bytes/sec transferred the last 30 seconds')",
        "Trying other mirror."
    ],
    "stdout": "Loaded plugins: fastestmirror\nLoading mirror speeds from cached hostfile\n * base: centos.mirror.py\n * extras: centos.mirror.py\n * updates: centos.mirror.py\nResolving Dependencies\n--> Running transaction check\n---> Package bind-export-libs.x86_64 32:9.11.4-16.P2.el7_8.2 will be updated\n---> Package bind-export-libs.x86_64 32:9.11.4-16.P2.el7_8.6 will be an update\n---> Package binutils.x86_64 0:2.27-43.base.el7 will be updated\n---> Package binutils.x86_64 0:2.27-43.base.el7_8.1 will be an update\n---> Package ca-certificates.noarch 0:2019.2.32-76.el7_7 will be updated\n---> Package ca-certificates.noarch 0:2020.2.41-70.0.el7_8 will be an update\n---> Package curl.x86_64 0:7.29.0-57.el7 will be updated\n---> Package curl.x86_64 0:7.29.0-57.el7_8.1 will be an update\n---> Package dbus.x86_64 1:1.10.24-13.el7_6 will be updated\n---> Package dbus.x86_64 1:1.10.24-14.el7_8 will be an update\n---> Package dbus-libs.x86_64 1:1.10.24-13.el7_6 will be updated\n---> Package dbus-libs.x86_64 1:1.10.24-14.el7_8 will be an update\n---> Package device-mapper.x86_64 7:1.02.164-7.el7_8.1 will be updated\n---> Package device-mapper.x86_64 7:1.02.164-7.el7_8.2 will be an update\n---> Package device-mapper-libs.x86_64 7:1.02.164-7.el7_8.1 will be updated\n---> Package device-mapper-libs.x86_64 7:1.02.164-7.el7_8.2 will be an update\n---> Package grub2.x86_64 1:2.02-0.81.el7.centos will be updated\n---> Package grub2.x86_64 1:2.02-0.86.el7.centos will be an update\n---> Package grub2-common.noarch 1:2.02-0.81.el7.centos will be updated\n---> Package grub2-common.noarch 1:2.02-0.86.el7.centos will be an update\n---> Package grub2-pc.x86_64 1:2.02-0.81.el7.centos will be updated\n---> Package grub2-pc.x86_64 1:2.02-0.86.el7.centos will be an update\n---> Package grub2-pc-modules.noarch 1:2.02-0.81.el7.centos will be updated\n---> Package grub2-pc-modules.noarch 1:2.02-0.86.el7.centos will be an update\n---> Package grub2-tools.x86_64 1:2.02-0.81.el7.centos will be updated\n---> Package grub2-tools.x86_64 1:2.02-0.86.el7.centos will be an update\n---> Package grub2-tools-extra.x86_64 1:2.02-0.81.el7.centos will be updated\n---> Package grub2-tools-extra.x86_64 1:2.02-0.86.el7.centos will be an update\n---> Package grub2-tools-minimal.x86_64 1:2.02-0.81.el7.centos will be updated\n---> Package grub2-tools-minimal.x86_64 1:2.02-0.86.el7.centos will be an update\n---> Package kernel.x86_64 0:3.10.0-1127.19.1.el7 will be installed\n---> Package kernel-tools.x86_64 0:3.10.0-1127.el7 will be updated\n---> Package kernel-tools.x86_64 0:3.10.0-1127.19.1.el7 will be an update\n---> Package kernel-tools-libs.x86_64 0:3.10.0-1127.el7 will be updated\n---> Package kernel-tools-libs.x86_64 0:3.10.0-1127.19.1.el7 will be an update\n---> Package libcurl.x86_64 0:7.29.0-57.el7 will be updated\n---> Package libcurl.x86_64 0:7.29.0-57.el7_8.1 will be an update\n---> Package libwbclient.x86_64 0:4.10.4-10.el7 will be updated\n---> Package libwbclient.x86_64 0:4.10.4-11.el7_8 will be an update\n---> Package nfs-utils.x86_64 1:1.3.0-0.66.el7 will be updated\n---> Package nfs-utils.x86_64 1:1.3.0-0.66.el7_8 will be an update\n---> Package open-vm-tools.x86_64 0:10.3.10-2.el7 will be updated\n---> Package open-vm-tools.x86_64 0:10.3.10-2.el7_8.1 will be an update\n---> Package python-perf.x86_64 0:3.10.0-1127.el7 will be updated\n---> Package python-perf.x86_64 0:3.10.0-1127.19.1.el7 will be an update\n---> Package rsyslog.x86_64 0:8.24.0-52.el7 will be updated\n---> Package rsyslog.x86_64 0:8.24.0-52.el7_8.2 will be an update\n---> Package samba-client-libs.x86_64 0:4.10.4-10.el7 will be updated\n---> Package samba-client-libs.x86_64 0:4.10.4-11.el7_8 will be an update\n---> Package samba-common.noarch 0:4.10.4-10.el7 will be updated\n---> Package samba-common.noarch 0:4.10.4-11.el7_8 will be an update\n---> Package samba-common-libs.x86_64 0:4.10.4-10.el7 will be updated\n---> Package samba-common-libs.x86_64 0:4.10.4-11.el7_8 will be an update\n---> Package samba-libs.x86_64 0:4.10.4-10.el7 will be updated\n---> Package samba-libs.x86_64 0:4.10.4-11.el7_8 will be an update\n---> Package selinux-policy.noarch 0:3.13.1-266.el7 will be updated\n---> Package selinux-policy.noarch 0:3.13.1-266.el7_8.1 will be an update\n---> Package selinux-policy-targeted.noarch 0:3.13.1-266.el7 will be updated\n---> Package selinux-policy-targeted.noarch 0:3.13.1-266.el7_8.1 will be an update\n---> Package systemd.x86_64 0:219-73.el7_8.5 will be updated\n---> Package systemd.x86_64 0:219-73.el7_8.9 will be an update\n---> Package systemd-libs.x86_64 0:219-73.el7_8.5 will be updated\n---> Package systemd-libs.x86_64 0:219-73.el7_8.9 will be an update\n---> Package systemd-sysv.x86_64 0:219-73.el7_8.5 will be updated\n---> Package systemd-sysv.x86_64 0:219-73.el7_8.9 will be an update\n---> Package yum-plugin-fastestmirror.noarch 0:1.1.31-53.el7 will be updated\n---> Package yum-plugin-fastestmirror.noarch 0:1.1.31-54.el7_8 will be an update\n---> Package yum-utils.noarch 0:1.1.31-53.el7 will be updated\n---> Package yum-utils.noarch 0:1.1.31-54.el7_8 will be an update\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package                    Arch     Version                    Repository\n                                                                           Size\n================================================================================\nInstalling:\n kernel                     x86_64   3.10.0-1127.19.1.el7       updates    50 M\nUpdating:\n bind-export-libs           x86_64   32:9.11.4-16.P2.el7_8.6    updates   1.1 M\n binutils                   x86_64   2.27-43.base.el7_8.1       updates   5.9 M\n ca-certificates            noarch   2020.2.41-70.0.el7_8       updates   382 k\n curl                       x86_64   7.29.0-57.el7_8.1          updates   271 k\n dbus                       x86_64   1:1.10.24-14.el7_8         updates   245 k\n dbus-libs                  x86_64   1:1.10.24-14.el7_8         updates   169 k\n device-mapper              x86_64   7:1.02.164-7.el7_8.2       updates   295 k\n device-mapper-libs         x86_64   7:1.02.164-7.el7_8.2       updates   324 k\n grub2                      x86_64   1:2.02-0.86.el7.centos     updates    32 k\n grub2-common               noarch   1:2.02-0.86.el7.centos     updates   729 k\n grub2-pc                   x86_64   1:2.02-0.86.el7.centos     updates    32 k\n grub2-pc-modules           noarch   1:2.02-0.86.el7.centos     updates   850 k\n grub2-tools                x86_64   1:2.02-0.86.el7.centos     updates   1.8 M\n grub2-tools-extra          x86_64   1:2.02-0.86.el7.centos     updates   1.0 M\n grub2-tools-minimal        x86_64   1:2.02-0.86.el7.centos     updates   174 k\n kernel-tools               x86_64   3.10.0-1127.19.1.el7       updates   8.1 M\n kernel-tools-libs          x86_64   3.10.0-1127.19.1.el7       updates   8.0 M\n libcurl                    x86_64   7.29.0-57.el7_8.1          updates   223 k\n libwbclient                x86_64   4.10.4-11.el7_8            updates   113 k\n nfs-utils                  x86_64   1:1.3.0-0.66.el7_8         updates   412 k\n open-vm-tools              x86_64   10.3.10-2.el7_8.1          updates   674 k\n python-perf                x86_64   3.10.0-1127.19.1.el7       updates   8.1 M\n rsyslog                    x86_64   8.24.0-52.el7_8.2          updates   621 k\n samba-client-libs          x86_64   4.10.4-11.el7_8            updates   5.0 M\n samba-common               noarch   4.10.4-11.el7_8            updates   212 k\n samba-common-libs          x86_64   4.10.4-11.el7_8            updates   176 k\n samba-libs                 x86_64   4.10.4-11.el7_8            updates   271 k\n selinux-policy             noarch   3.13.1-266.el7_8.1         updates   497 k\n selinux-policy-targeted    noarch   3.13.1-266.el7_8.1         updates   7.0 M\n systemd                    x86_64   219-73.el7_8.9             updates   5.1 M\n systemd-libs               x86_64   219-73.el7_8.9             updates   416 k\n systemd-sysv               x86_64   219-73.el7_8.9             updates    94 k\n yum-plugin-fastestmirror   noarch   1.1.31-54.el7_8            updates    34 k\n yum-utils                  noarch   1.1.31-54.el7_8            updates   122 k\n\nTransaction Summary\n================================================================================\nInstall   1 Package\nUpgrade  34 Packages\n\nTotal download size: 108 M\nDownloading packages:\nNo Presto metadata available for updates\n--------------------------------------------------------------------------------\nTotal                                              1.4 MB/s | 108 MB  01:18     \nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Updating   : systemd-libs-219-73.el7_8.9.x86_64                          1/69 \n  Updating   : 1:grub2-common-2.02-0.86.el7.centos.noarch                  2/69 \n  Updating   : libcurl-7.29.0-57.el7_8.1.x86_64                            3/69 \n  Updating   : 1:grub2-pc-modules-2.02-0.86.el7.centos.noarch              4/69 \n  Updating   : 1:dbus-libs-1.10.24-14.el7_8.x86_64                         5/69 \n  Updating   : systemd-219-73.el7_8.9.x86_64                               6/69 \n  Updating   : 1:dbus-1.10.24-14.el7_8.x86_64                              7/69 \n  Updating   : samba-common-4.10.4-11.el7_8.noarch                         8/69 \n  Updating   : libwbclient-4.10.4-11.el7_8.x86_64                          9/69 \n  Updating   : samba-libs-4.10.4-11.el7_8.x86_64                          10/69 \n  Updating   : samba-common-libs-4.10.4-11.el7_8.x86_64                   11/69 \n  Updating   : samba-client-libs-4.10.4-11.el7_8.x86_64                   12/69 \n  Updating   : 7:device-mapper-libs-1.02.164-7.el7_8.2.x86_64             13/69 \n  Updating   : 7:device-mapper-1.02.164-7.el7_8.2.x86_64                  14/69 \n  Updating   : 1:grub2-tools-minimal-2.02-0.86.el7.centos.x86_64          15/69 \n  Updating   : 1:grub2-tools-2.02-0.86.el7.centos.x86_64                  16/69 \n  Updating   : 1:grub2-tools-extra-2.02-0.86.el7.centos.x86_64            17/69 \n  Updating   : 1:grub2-pc-2.02-0.86.el7.centos.x86_64                     18/69 \n  Updating   : selinux-policy-3.13.1-266.el7_8.1.noarch                   19/69 \n  Updating   : kernel-tools-libs-3.10.0-1127.19.1.el7.x86_64              20/69 \n  Updating   : kernel-tools-3.10.0-1127.19.1.el7.x86_64                   21/69 \n  Updating   : selinux-policy-targeted-3.13.1-266.el7_8.1.noarch          22/69 \n  Updating   : 1:grub2-2.02-0.86.el7.centos.x86_64                        23/69 \n  Updating   : 1:nfs-utils-1.3.0-0.66.el7_8.x86_64                        24/69 \n  Updating   : rsyslog-8.24.0-52.el7_8.2.x86_64                           25/69 \n  Updating   : systemd-sysv-219-73.el7_8.9.x86_64                         26/69 \n  Updating   : open-vm-tools-10.3.10-2.el7_8.1.x86_64                     27/69 \n  Updating   : curl-7.29.0-57.el7_8.1.x86_64                              28/69 \n  Installing : kernel-3.10.0-1127.19.1.el7.x86_64                         29/69 \n  Updating   : python-perf-3.10.0-1127.19.1.el7.x86_64                    30/69 \n  Updating   : yum-utils-1.1.31-54.el7_8.noarch                           31/69 \n  Updating   : binutils-2.27-43.base.el7_8.1.x86_64                       32/69 \n  Updating   : yum-plugin-fastestmirror-1.1.31-54.el7_8.noarch            33/69 \n  Updating   : ca-certificates-2020.2.41-70.0.el7_8.noarch                34/69 \n  Updating   : 32:bind-export-libs-9.11.4-16.P2.el7_8.6.x86_64            35/69 \n  Cleanup    : selinux-policy-targeted-3.13.1-266.el7.noarch              36/69 \n  Cleanup    : systemd-sysv-219-73.el7_8.5.x86_64                         37/69 \n  Cleanup    : 1:grub2-2.02-0.81.el7.centos.x86_64                        38/69 \n  Cleanup    : 1:grub2-pc-2.02-0.81.el7.centos.x86_64                     39/69 \n  Cleanup    : samba-common-libs-4.10.4-10.el7.x86_64                     40/69 \n  Cleanup    : samba-libs-4.10.4-10.el7.x86_64                            41/69 \n  Cleanup    : libwbclient-4.10.4-10.el7.x86_64                           42/69 \n  Cleanup    : samba-client-libs-4.10.4-10.el7.x86_64                     43/69 \n  Cleanup    : 1:grub2-tools-extra-2.02-0.81.el7.centos.x86_64            44/69 \n  Cleanup    : 1:grub2-tools-2.02-0.81.el7.centos.x86_64                  45/69 \n  Cleanup    : 1:grub2-tools-minimal-2.02-0.81.el7.centos.x86_64          46/69 \n  Cleanup    : 1:nfs-utils-1.3.0-0.66.el7.x86_64                          47/69 \n  Cleanup    : 7:device-mapper-1.02.164-7.el7_8.1.x86_64                  48/69 \n  Cleanup    : 7:device-mapper-libs-1.02.164-7.el7_8.1.x86_64             49/69 \n  Cleanup    : open-vm-tools-10.3.10-2.el7.x86_64                         50/69 \n  Cleanup    : rsyslog-8.24.0-52.el7.x86_64                               51/69 \n  Cleanup    : samba-common-4.10.4-10.el7.noarch                          52/69 \n  Cleanup    : 1:grub2-pc-modules-2.02-0.81.el7.centos.noarch             53/69 \n  Cleanup    : 1:dbus-1.10.24-13.el7_6.x86_64                             54/69 \n  Cleanup    : systemd-219-73.el7_8.5.x86_64                              55/69 \n  Cleanup    : 1:dbus-libs-1.10.24-13.el7_6.x86_64                        56/69 \n  Cleanup    : curl-7.29.0-57.el7.x86_64                                  57/69 \n  Cleanup    : kernel-tools-3.10.0-1127.el7.x86_64                        58/69 \n  Cleanup    : 1:grub2-common-2.02-0.81.el7.centos.noarch                 59/69 \n  Cleanup    : selinux-policy-3.13.1-266.el7.noarch                       60/69 \n  Cleanup    : yum-utils-1.1.31-53.el7.noarch                             61/69 \n  Cleanup    : yum-plugin-fastestmirror-1.1.31-53.el7.noarch              62/69 \n  Cleanup    : ca-certificates-2019.2.32-76.el7_7.noarch                  63/69 \n  Cleanup    : kernel-tools-libs-3.10.0-1127.el7.x86_64                   64/69 \n  Cleanup    : libcurl-7.29.0-57.el7.x86_64                               65/69 \n  Cleanup    : systemd-libs-219-73.el7_8.5.x86_64                         66/69 \n  Cleanup    : python-perf-3.10.0-1127.el7.x86_64                         67/69 \n  Cleanup    : binutils-2.27-43.base.el7.x86_64                           68/69 \n  Cleanup    : 32:bind-export-libs-9.11.4-16.P2.el7_8.2.x86_64            69/69 \n  Verifying  : samba-client-libs-4.10.4-11.el7_8.x86_64                    1/69 \n  Verifying  : 1:dbus-libs-1.10.24-14.el7_8.x86_64                         2/69 \n  Verifying  : kernel-tools-3.10.0-1127.19.1.el7.x86_64                    3/69 \n  Verifying  : 32:bind-export-libs-9.11.4-16.P2.el7_8.6.x86_64             4/69 \n  Verifying  : ca-certificates-2020.2.41-70.0.el7_8.noarch                 5/69 \n  Verifying  : kernel-tools-libs-3.10.0-1127.19.1.el7.x86_64               6/69 \n  Verifying  : yum-plugin-fastestmirror-1.1.31-54.el7_8.noarch             7/69 \n  Verifying  : 1:grub2-2.02-0.86.el7.centos.x86_64                         8/69 \n  Verifying  : libwbclient-4.10.4-11.el7_8.x86_64                          9/69 \n  Verifying  : selinux-policy-3.13.1-266.el7_8.1.noarch                   10/69 \n  Verifying  : binutils-2.27-43.base.el7_8.1.x86_64                       11/69 \n  Verifying  : rsyslog-8.24.0-52.el7_8.2.x86_64                           12/69 \n  Verifying  : 1:dbus-1.10.24-14.el7_8.x86_64                             13/69 \n  Verifying  : 1:grub2-common-2.02-0.86.el7.centos.noarch                 14/69 \n  Verifying  : 1:grub2-pc-2.02-0.86.el7.centos.x86_64                     15/69 \n  Verifying  : yum-utils-1.1.31-54.el7_8.noarch                           16/69 \n  Verifying  : 7:device-mapper-1.02.164-7.el7_8.2.x86_64                  17/69 \n  Verifying  : systemd-sysv-219-73.el7_8.9.x86_64                         18/69 \n  Verifying  : systemd-219-73.el7_8.9.x86_64                              19/69 \n  Verifying  : systemd-libs-219-73.el7_8.9.x86_64                         20/69 \n  Verifying  : curl-7.29.0-57.el7_8.1.x86_64                              21/69 \n  Verifying  : python-perf-3.10.0-1127.19.1.el7.x86_64                    22/69 \n  Verifying  : 7:device-mapper-libs-1.02.164-7.el7_8.2.x86_64             23/69 \n  Verifying  : 1:grub2-tools-2.02-0.86.el7.centos.x86_64                  24/69 \n  Verifying  : samba-libs-4.10.4-11.el7_8.x86_64                          25/69 \n  Verifying  : 1:grub2-tools-minimal-2.02-0.86.el7.centos.x86_64          26/69 \n  Verifying  : open-vm-tools-10.3.10-2.el7_8.1.x86_64                     27/69 \n  Verifying  : samba-common-4.10.4-11.el7_8.noarch                        28/69 \n  Verifying  : 1:grub2-tools-extra-2.02-0.86.el7.centos.x86_64            29/69 \n  Verifying  : selinux-policy-targeted-3.13.1-266.el7_8.1.noarch          30/69 \n  Verifying  : libcurl-7.29.0-57.el7_8.1.x86_64                           31/69 \n  Verifying  : samba-common-libs-4.10.4-11.el7_8.x86_64                   32/69 \n  Verifying  : 1:nfs-utils-1.3.0-0.66.el7_8.x86_64                        33/69 \n  Verifying  : kernel-3.10.0-1127.19.1.el7.x86_64                         34/69 \n  Verifying  : 1:grub2-pc-modules-2.02-0.86.el7.centos.noarch             35/69 \n  Verifying  : rsyslog-8.24.0-52.el7.x86_64                               36/69 \n  Verifying  : 1:grub2-2.02-0.81.el7.centos.x86_64                        37/69 \n  Verifying  : 1:grub2-tools-2.02-0.81.el7.centos.x86_64                  38/69 \n  Verifying  : 1:grub2-common-2.02-0.81.el7.centos.noarch                 39/69 \n  Verifying  : 1:grub2-pc-2.02-0.81.el7.centos.x86_64                     40/69 \n  Verifying  : systemd-219-73.el7_8.5.x86_64                              41/69 \n  Verifying  : 32:bind-export-libs-9.11.4-16.P2.el7_8.2.x86_64            42/69 \n  Verifying  : libcurl-7.29.0-57.el7.x86_64                               43/69 \n  Verifying  : curl-7.29.0-57.el7.x86_64                                  44/69 \n  Verifying  : samba-common-4.10.4-10.el7.noarch                          45/69 \n  Verifying  : 7:device-mapper-libs-1.02.164-7.el7_8.1.x86_64             46/69 \n  Verifying  : ca-certificates-2019.2.32-76.el7_7.noarch                  47/69 \n  Verifying  : samba-common-libs-4.10.4-10.el7.x86_64                     48/69 \n  Verifying  : samba-libs-4.10.4-10.el7.x86_64                            49/69 \n  Verifying  : libwbclient-4.10.4-10.el7.x86_64                           50/69 \n  Verifying  : systemd-sysv-219-73.el7_8.5.x86_64                         51/69 \n  Verifying  : selinux-policy-3.13.1-266.el7.noarch                       52/69 \n  Verifying  : 1:dbus-libs-1.10.24-13.el7_6.x86_64                        53/69 \n  Verifying  : binutils-2.27-43.base.el7.x86_64                           54/69 \n  Verifying  : 1:dbus-1.10.24-13.el7_6.x86_64                             55/69 \n  Verifying  : 7:device-mapper-1.02.164-7.el7_8.1.x86_64                  56/69 \n  Verifying  : kernel-tools-3.10.0-1127.el7.x86_64                        57/69 \n  Verifying  : kernel-tools-libs-3.10.0-1127.el7.x86_64                   58/69 \n  Verifying  : 1:nfs-utils-1.3.0-0.66.el7.x86_64                          59/69 \n  Verifying  : 1:grub2-pc-modules-2.02-0.81.el7.centos.noarch             60/69 \n  Verifying  : selinux-policy-targeted-3.13.1-266.el7.noarch              61/69 \n  Verifying  : samba-client-libs-4.10.4-10.el7.x86_64                     62/69 \n  Verifying  : python-perf-3.10.0-1127.el7.x86_64                         63/69 \n  Verifying  : 1:grub2-tools-minimal-2.02-0.81.el7.centos.x86_64          64/69 \n  Verifying  : 1:grub2-tools-extra-2.02-0.81.el7.centos.x86_64            65/69 \n  Verifying  : open-vm-tools-10.3.10-2.el7.x86_64                         66/69 \n  Verifying  : systemd-libs-219-73.el7_8.5.x86_64                         67/69 \n  Verifying  : yum-utils-1.1.31-53.el7.noarch                             68/69 \n  Verifying  : yum-plugin-fastestmirror-1.1.31-53.el7.noarch              69/69 \n\nInstalled:\n  kernel.x86_64 0:3.10.0-1127.19.1.el7                                          \n\nUpdated:\n  bind-export-libs.x86_64 32:9.11.4-16.P2.el7_8.6                               \n  binutils.x86_64 0:2.27-43.base.el7_8.1                                        \n  ca-certificates.noarch 0:2020.2.41-70.0.el7_8                                 \n  curl.x86_64 0:7.29.0-57.el7_8.1                                               \n  dbus.x86_64 1:1.10.24-14.el7_8                                                \n  dbus-libs.x86_64 1:1.10.24-14.el7_8                                           \n  device-mapper.x86_64 7:1.02.164-7.el7_8.2                                     \n  device-mapper-libs.x86_64 7:1.02.164-7.el7_8.2                                \n  grub2.x86_64 1:2.02-0.86.el7.centos                                           \n  grub2-common.noarch 1:2.02-0.86.el7.centos                                    \n  grub2-pc.x86_64 1:2.02-0.86.el7.centos                                        \n  grub2-pc-modules.noarch 1:2.02-0.86.el7.centos                                \n  grub2-tools.x86_64 1:2.02-0.86.el7.centos                                     \n  grub2-tools-extra.x86_64 1:2.02-0.86.el7.centos                               \n  grub2-tools-minimal.x86_64 1:2.02-0.86.el7.centos                             \n  kernel-tools.x86_64 0:3.10.0-1127.19.1.el7                                    \n  kernel-tools-libs.x86_64 0:3.10.0-1127.19.1.el7                               \n  libcurl.x86_64 0:7.29.0-57.el7_8.1                                            \n  libwbclient.x86_64 0:4.10.4-11.el7_8                                          \n  nfs-utils.x86_64 1:1.3.0-0.66.el7_8                                           \n  open-vm-tools.x86_64 0:10.3.10-2.el7_8.1                                      \n  python-perf.x86_64 0:3.10.0-1127.19.1.el7                                     \n  rsyslog.x86_64 0:8.24.0-52.el7_8.2                                            \n  samba-client-libs.x86_64 0:4.10.4-11.el7_8                                    \n  samba-common.noarch 0:4.10.4-11.el7_8                                         \n  samba-common-libs.x86_64 0:4.10.4-11.el7_8                                    \n  samba-libs.x86_64 0:4.10.4-11.el7_8                                           \n  selinux-policy.noarch 0:3.13.1-266.el7_8.1                                    \n  selinux-policy-targeted.noarch 0:3.13.1-266.el7_8.1                           \n  systemd.x86_64 0:219-73.el7_8.9                                               \n  systemd-libs.x86_64 0:219-73.el7_8.9                                          \n  systemd-sysv.x86_64 0:219-73.el7_8.9                                          \n  yum-plugin-fastestmirror.noarch 0:1.1.31-54.el7_8                             \n  yum-utils.noarch 0:1.1.31-54.el7_8                                            \n\nComplete!",
    "stdout_lines": [
        "Loaded plugins: fastestmirror",
        "Loading mirror speeds from cached hostfile",
        " * base: centos.mirror.py",
        " * extras: centos.mirror.py",
        " * updates: centos.mirror.py",
        "Resolving Dependencies",
        "--> Running transaction check",
        "---> Package bind-export-libs.x86_64 32:9.11.4-16.P2.el7_8.2 will be updated",
        "---> Package bind-export-libs.x86_64 32:9.11.4-16.P2.el7_8.6 will be an update",
        "---> Package binutils.x86_64 0:2.27-43.base.el7 will be updated",
        "---> Package binutils.x86_64 0:2.27-43.base.el7_8.1 will be an update",
        "---> Package ca-certificates.noarch 0:2019.2.32-76.el7_7 will be updated",
        "---> Package ca-certificates.noarch 0:2020.2.41-70.0.el7_8 will be an update",
        "---> Package curl.x86_64 0:7.29.0-57.el7 will be updated",
        "---> Package curl.x86_64 0:7.29.0-57.el7_8.1 will be an update",
        "---> Package dbus.x86_64 1:1.10.24-13.el7_6 will be updated",
        "---> Package dbus.x86_64 1:1.10.24-14.el7_8 will be an update",
        "---> Package dbus-libs.x86_64 1:1.10.24-13.el7_6 will be updated",
        "---> Package dbus-libs.x86_64 1:1.10.24-14.el7_8 will be an update",
        "---> Package device-mapper.x86_64 7:1.02.164-7.el7_8.1 will be updated",
        "---> Package device-mapper.x86_64 7:1.02.164-7.el7_8.2 will be an update",
        "---> Package device-mapper-libs.x86_64 7:1.02.164-7.el7_8.1 will be updated",
        "---> Package device-mapper-libs.x86_64 7:1.02.164-7.el7_8.2 will be an update",
        "---> Package grub2.x86_64 1:2.02-0.81.el7.centos will be updated",
        "---> Package grub2.x86_64 1:2.02-0.86.el7.centos will be an update",
        "---> Package grub2-common.noarch 1:2.02-0.81.el7.centos will be updated",
        "---> Package grub2-common.noarch 1:2.02-0.86.el7.centos will be an update",
        "---> Package grub2-pc.x86_64 1:2.02-0.81.el7.centos will be updated",
        "---> Package grub2-pc.x86_64 1:2.02-0.86.el7.centos will be an update",
        "---> Package grub2-pc-modules.noarch 1:2.02-0.81.el7.centos will be updated",
        "---> Package grub2-pc-modules.noarch 1:2.02-0.86.el7.centos will be an update",
        "---> Package grub2-tools.x86_64 1:2.02-0.81.el7.centos will be updated",
        "---> Package grub2-tools.x86_64 1:2.02-0.86.el7.centos will be an update",
        "---> Package grub2-tools-extra.x86_64 1:2.02-0.81.el7.centos will be updated",
        "---> Package grub2-tools-extra.x86_64 1:2.02-0.86.el7.centos will be an update",
        "---> Package grub2-tools-minimal.x86_64 1:2.02-0.81.el7.centos will be updated",
        "---> Package grub2-tools-minimal.x86_64 1:2.02-0.86.el7.centos will be an update",
        "---> Package kernel.x86_64 0:3.10.0-1127.19.1.el7 will be installed",
        "---> Package kernel-tools.x86_64 0:3.10.0-1127.el7 will be updated",
        "---> Package kernel-tools.x86_64 0:3.10.0-1127.19.1.el7 will be an update",
        "---> Package kernel-tools-libs.x86_64 0:3.10.0-1127.el7 will be updated",
        "---> Package kernel-tools-libs.x86_64 0:3.10.0-1127.19.1.el7 will be an update",
        "---> Package libcurl.x86_64 0:7.29.0-57.el7 will be updated",
        "---> Package libcurl.x86_64 0:7.29.0-57.el7_8.1 will be an update",
        "---> Package libwbclient.x86_64 0:4.10.4-10.el7 will be updated",
        "---> Package libwbclient.x86_64 0:4.10.4-11.el7_8 will be an update",
        "---> Package nfs-utils.x86_64 1:1.3.0-0.66.el7 will be updated",
        "---> Package nfs-utils.x86_64 1:1.3.0-0.66.el7_8 will be an update",
        "---> Package open-vm-tools.x86_64 0:10.3.10-2.el7 will be updated",
        "---> Package open-vm-tools.x86_64 0:10.3.10-2.el7_8.1 will be an update",
        "---> Package python-perf.x86_64 0:3.10.0-1127.el7 will be updated",
        "---> Package python-perf.x86_64 0:3.10.0-1127.19.1.el7 will be an update",
        "---> Package rsyslog.x86_64 0:8.24.0-52.el7 will be updated",
        "---> Package rsyslog.x86_64 0:8.24.0-52.el7_8.2 will be an update",
        "---> Package samba-client-libs.x86_64 0:4.10.4-10.el7 will be updated",
        "---> Package samba-client-libs.x86_64 0:4.10.4-11.el7_8 will be an update",
        "---> Package samba-common.noarch 0:4.10.4-10.el7 will be updated",
        "---> Package samba-common.noarch 0:4.10.4-11.el7_8 will be an update",
        "---> Package samba-common-libs.x86_64 0:4.10.4-10.el7 will be updated",
        "---> Package samba-common-libs.x86_64 0:4.10.4-11.el7_8 will be an update",
        "---> Package samba-libs.x86_64 0:4.10.4-10.el7 will be updated",
        "---> Package samba-libs.x86_64 0:4.10.4-11.el7_8 will be an update",
        "---> Package selinux-policy.noarch 0:3.13.1-266.el7 will be updated",
        "---> Package selinux-policy.noarch 0:3.13.1-266.el7_8.1 will be an update",
        "---> Package selinux-policy-targeted.noarch 0:3.13.1-266.el7 will be updated",
        "---> Package selinux-policy-targeted.noarch 0:3.13.1-266.el7_8.1 will be an update",
        "---> Package systemd.x86_64 0:219-73.el7_8.5 will be updated",
        "---> Package systemd.x86_64 0:219-73.el7_8.9 will be an update",
        "---> Package systemd-libs.x86_64 0:219-73.el7_8.5 will be updated",
        "---> Package systemd-libs.x86_64 0:219-73.el7_8.9 will be an update",
        "---> Package systemd-sysv.x86_64 0:219-73.el7_8.5 will be updated",
        "---> Package systemd-sysv.x86_64 0:219-73.el7_8.9 will be an update",
        "---> Package yum-plugin-fastestmirror.noarch 0:1.1.31-53.el7 will be updated",
        "---> Package yum-plugin-fastestmirror.noarch 0:1.1.31-54.el7_8 will be an update",
        "---> Package yum-utils.noarch 0:1.1.31-53.el7 will be updated",
        "---> Package yum-utils.noarch 0:1.1.31-54.el7_8 will be an update",
        "--> Finished Dependency Resolution",
        "",
        "Dependencies Resolved",
        "",
        "================================================================================",
        " Package                    Arch     Version                    Repository",
        "                                                                           Size",
        "================================================================================",
        "Installing:",
        " kernel                     x86_64   3.10.0-1127.19.1.el7       updates    50 M",
        "Updating:",
        " bind-export-libs           x86_64   32:9.11.4-16.P2.el7_8.6    updates   1.1 M",
        " binutils                   x86_64   2.27-43.base.el7_8.1       updates   5.9 M",
        " ca-certificates            noarch   2020.2.41-70.0.el7_8       updates   382 k",
        " curl                       x86_64   7.29.0-57.el7_8.1          updates   271 k",
        " dbus                       x86_64   1:1.10.24-14.el7_8         updates   245 k",
        " dbus-libs                  x86_64   1:1.10.24-14.el7_8         updates   169 k",
        " device-mapper              x86_64   7:1.02.164-7.el7_8.2       updates   295 k",
        " device-mapper-libs         x86_64   7:1.02.164-7.el7_8.2       updates   324 k",
        " grub2                      x86_64   1:2.02-0.86.el7.centos     updates    32 k",
        " grub2-common               noarch   1:2.02-0.86.el7.centos     updates   729 k",
        " grub2-pc                   x86_64   1:2.02-0.86.el7.centos     updates    32 k",
        " grub2-pc-modules           noarch   1:2.02-0.86.el7.centos     updates   850 k",
        " grub2-tools                x86_64   1:2.02-0.86.el7.centos     updates   1.8 M",
        " grub2-tools-extra          x86_64   1:2.02-0.86.el7.centos     updates   1.0 M",
        " grub2-tools-minimal        x86_64   1:2.02-0.86.el7.centos     updates   174 k",
        " kernel-tools               x86_64   3.10.0-1127.19.1.el7       updates   8.1 M",
        " kernel-tools-libs          x86_64   3.10.0-1127.19.1.el7       updates   8.0 M",
        " libcurl                    x86_64   7.29.0-57.el7_8.1          updates   223 k",
        " libwbclient                x86_64   4.10.4-11.el7_8            updates   113 k",
        " nfs-utils                  x86_64   1:1.3.0-0.66.el7_8         updates   412 k",
        " open-vm-tools              x86_64   10.3.10-2.el7_8.1          updates   674 k",
        " python-perf                x86_64   3.10.0-1127.19.1.el7       updates   8.1 M",
        " rsyslog                    x86_64   8.24.0-52.el7_8.2          updates   621 k",
        " samba-client-libs          x86_64   4.10.4-11.el7_8            updates   5.0 M",
        " samba-common               noarch   4.10.4-11.el7_8            updates   212 k",
        " samba-common-libs          x86_64   4.10.4-11.el7_8            updates   176 k",
        " samba-libs                 x86_64   4.10.4-11.el7_8            updates   271 k",
        " selinux-policy             noarch   3.13.1-266.el7_8.1         updates   497 k",
        " selinux-policy-targeted    noarch   3.13.1-266.el7_8.1         updates   7.0 M",
        " systemd                    x86_64   219-73.el7_8.9             updates   5.1 M",
        " systemd-libs               x86_64   219-73.el7_8.9             updates   416 k",
        " systemd-sysv               x86_64   219-73.el7_8.9             updates    94 k",
        " yum-plugin-fastestmirror   noarch   1.1.31-54.el7_8            updates    34 k",
        " yum-utils                  noarch   1.1.31-54.el7_8            updates   122 k",
        "",
        "Transaction Summary",
        "================================================================================",
        "Install   1 Package",
        "Upgrade  34 Packages",
        "",
        "Total download size: 108 M",
        "Downloading packages:",
        "No Presto metadata available for updates",
        "--------------------------------------------------------------------------------",
        "Total                                              1.4 MB/s | 108 MB  01:18     ",
        "Running transaction check",
        "Running transaction test",
        "Transaction test succeeded",
        "Running transaction",
        "  Updating   : systemd-libs-219-73.el7_8.9.x86_64                          1/69 ",
        "  Updating   : 1:grub2-common-2.02-0.86.el7.centos.noarch                  2/69 ",
        "  Updating   : libcurl-7.29.0-57.el7_8.1.x86_64                            3/69 ",
        "  Updating   : 1:grub2-pc-modules-2.02-0.86.el7.centos.noarch              4/69 ",
        "  Updating   : 1:dbus-libs-1.10.24-14.el7_8.x86_64                         5/69 ",
        "  Updating   : systemd-219-73.el7_8.9.x86_64                               6/69 ",
        "  Updating   : 1:dbus-1.10.24-14.el7_8.x86_64                              7/69 ",
        "  Updating   : samba-common-4.10.4-11.el7_8.noarch                         8/69 ",
        "  Updating   : libwbclient-4.10.4-11.el7_8.x86_64                          9/69 ",
        "  Updating   : samba-libs-4.10.4-11.el7_8.x86_64                          10/69 ",
        "  Updating   : samba-common-libs-4.10.4-11.el7_8.x86_64                   11/69 ",
        "  Updating   : samba-client-libs-4.10.4-11.el7_8.x86_64                   12/69 ",
        "  Updating   : 7:device-mapper-libs-1.02.164-7.el7_8.2.x86_64             13/69 ",
        "  Updating   : 7:device-mapper-1.02.164-7.el7_8.2.x86_64                  14/69 ",
        "  Updating   : 1:grub2-tools-minimal-2.02-0.86.el7.centos.x86_64          15/69 ",
        "  Updating   : 1:grub2-tools-2.02-0.86.el7.centos.x86_64                  16/69 ",
        "  Updating   : 1:grub2-tools-extra-2.02-0.86.el7.centos.x86_64            17/69 ",
        "  Updating   : 1:grub2-pc-2.02-0.86.el7.centos.x86_64                     18/69 ",
        "  Updating   : selinux-policy-3.13.1-266.el7_8.1.noarch                   19/69 ",
        "  Updating   : kernel-tools-libs-3.10.0-1127.19.1.el7.x86_64              20/69 ",
        "  Updating   : kernel-tools-3.10.0-1127.19.1.el7.x86_64                   21/69 ",
        "  Updating   : selinux-policy-targeted-3.13.1-266.el7_8.1.noarch          22/69 ",
        "  Updating   : 1:grub2-2.02-0.86.el7.centos.x86_64                        23/69 ",
        "  Updating   : 1:nfs-utils-1.3.0-0.66.el7_8.x86_64                        24/69 ",
        "  Updating   : rsyslog-8.24.0-52.el7_8.2.x86_64                           25/69 ",
        "  Updating   : systemd-sysv-219-73.el7_8.9.x86_64                         26/69 ",
        "  Updating   : open-vm-tools-10.3.10-2.el7_8.1.x86_64                     27/69 ",
        "  Updating   : curl-7.29.0-57.el7_8.1.x86_64                              28/69 ",
        "  Installing : kernel-3.10.0-1127.19.1.el7.x86_64                         29/69 ",
        "  Updating   : python-perf-3.10.0-1127.19.1.el7.x86_64                    30/69 ",
        "  Updating   : yum-utils-1.1.31-54.el7_8.noarch                           31/69 ",
        "  Updating   : binutils-2.27-43.base.el7_8.1.x86_64                       32/69 ",
        "  Updating   : yum-plugin-fastestmirror-1.1.31-54.el7_8.noarch            33/69 ",
        "  Updating   : ca-certificates-2020.2.41-70.0.el7_8.noarch                34/69 ",
        "  Updating   : 32:bind-export-libs-9.11.4-16.P2.el7_8.6.x86_64            35/69 ",
        "  Cleanup    : selinux-policy-targeted-3.13.1-266.el7.noarch              36/69 ",
        "  Cleanup    : systemd-sysv-219-73.el7_8.5.x86_64                         37/69 ",
        "  Cleanup    : 1:grub2-2.02-0.81.el7.centos.x86_64                        38/69 ",
        "  Cleanup    : 1:grub2-pc-2.02-0.81.el7.centos.x86_64                     39/69 ",
        "  Cleanup    : samba-common-libs-4.10.4-10.el7.x86_64                     40/69 ",
        "  Cleanup    : samba-libs-4.10.4-10.el7.x86_64                            41/69 ",
        "  Cleanup    : libwbclient-4.10.4-10.el7.x86_64                           42/69 ",
        "  Cleanup    : samba-client-libs-4.10.4-10.el7.x86_64                     43/69 ",
        "  Cleanup    : 1:grub2-tools-extra-2.02-0.81.el7.centos.x86_64            44/69 ",
        "  Cleanup    : 1:grub2-tools-2.02-0.81.el7.centos.x86_64                  45/69 ",
        "  Cleanup    : 1:grub2-tools-minimal-2.02-0.81.el7.centos.x86_64          46/69 ",
        "  Cleanup    : 1:nfs-utils-1.3.0-0.66.el7.x86_64                          47/69 ",
        "  Cleanup    : 7:device-mapper-1.02.164-7.el7_8.1.x86_64                  48/69 ",
        "  Cleanup    : 7:device-mapper-libs-1.02.164-7.el7_8.1.x86_64             49/69 ",
        "  Cleanup    : open-vm-tools-10.3.10-2.el7.x86_64                         50/69 ",
        "  Cleanup    : rsyslog-8.24.0-52.el7.x86_64                               51/69 ",
        "  Cleanup    : samba-common-4.10.4-10.el7.noarch                          52/69 ",
        "  Cleanup    : 1:grub2-pc-modules-2.02-0.81.el7.centos.noarch             53/69 ",
        "  Cleanup    : 1:dbus-1.10.24-13.el7_6.x86_64                             54/69 ",
        "  Cleanup    : systemd-219-73.el7_8.5.x86_64                              55/69 ",
        "  Cleanup    : 1:dbus-libs-1.10.24-13.el7_6.x86_64                        56/69 ",
        "  Cleanup    : curl-7.29.0-57.el7.x86_64                                  57/69 ",
        "  Cleanup    : kernel-tools-3.10.0-1127.el7.x86_64                        58/69 ",
        "  Cleanup    : 1:grub2-common-2.02-0.81.el7.centos.noarch                 59/69 ",
        "  Cleanup    : selinux-policy-3.13.1-266.el7.noarch                       60/69 ",
        "  Cleanup    : yum-utils-1.1.31-53.el7.noarch                             61/69 ",
        "  Cleanup    : yum-plugin-fastestmirror-1.1.31-53.el7.noarch              62/69 ",
        "  Cleanup    : ca-certificates-2019.2.32-76.el7_7.noarch                  63/69 ",
        "  Cleanup    : kernel-tools-libs-3.10.0-1127.el7.x86_64                   64/69 ",
        "  Cleanup    : libcurl-7.29.0-57.el7.x86_64                               65/69 ",
        "  Cleanup    : systemd-libs-219-73.el7_8.5.x86_64                         66/69 ",
        "  Cleanup    : python-perf-3.10.0-1127.el7.x86_64                         67/69 ",
        "  Cleanup    : binutils-2.27-43.base.el7.x86_64                           68/69 ",
        "  Cleanup    : 32:bind-export-libs-9.11.4-16.P2.el7_8.2.x86_64            69/69 ",
        "  Verifying  : samba-client-libs-4.10.4-11.el7_8.x86_64                    1/69 ",
        "  Verifying  : 1:dbus-libs-1.10.24-14.el7_8.x86_64                         2/69 ",
        "  Verifying  : kernel-tools-3.10.0-1127.19.1.el7.x86_64                    3/69 ",
        "  Verifying  : 32:bind-export-libs-9.11.4-16.P2.el7_8.6.x86_64             4/69 ",
        "  Verifying  : ca-certificates-2020.2.41-70.0.el7_8.noarch                 5/69 ",
        "  Verifying  : kernel-tools-libs-3.10.0-1127.19.1.el7.x86_64               6/69 ",
        "  Verifying  : yum-plugin-fastestmirror-1.1.31-54.el7_8.noarch             7/69 ",
        "  Verifying  : 1:grub2-2.02-0.86.el7.centos.x86_64                         8/69 ",
        "  Verifying  : libwbclient-4.10.4-11.el7_8.x86_64                          9/69 ",
        "  Verifying  : selinux-policy-3.13.1-266.el7_8.1.noarch                   10/69 ",
        "  Verifying  : binutils-2.27-43.base.el7_8.1.x86_64                       11/69 ",
        "  Verifying  : rsyslog-8.24.0-52.el7_8.2.x86_64                           12/69 ",
        "  Verifying  : 1:dbus-1.10.24-14.el7_8.x86_64                             13/69 ",
        "  Verifying  : 1:grub2-common-2.02-0.86.el7.centos.noarch                 14/69 ",
        "  Verifying  : 1:grub2-pc-2.02-0.86.el7.centos.x86_64                     15/69 ",
        "  Verifying  : yum-utils-1.1.31-54.el7_8.noarch                           16/69 ",
        "  Verifying  : 7:device-mapper-1.02.164-7.el7_8.2.x86_64                  17/69 ",
        "  Verifying  : systemd-sysv-219-73.el7_8.9.x86_64                         18/69 ",
        "  Verifying  : systemd-219-73.el7_8.9.x86_64                              19/69 ",
        "  Verifying  : systemd-libs-219-73.el7_8.9.x86_64                         20/69 ",
        "  Verifying  : curl-7.29.0-57.el7_8.1.x86_64                              21/69 ",
        "  Verifying  : python-perf-3.10.0-1127.19.1.el7.x86_64                    22/69 ",
        "  Verifying  : 7:device-mapper-libs-1.02.164-7.el7_8.2.x86_64             23/69 ",
        "  Verifying  : 1:grub2-tools-2.02-0.86.el7.centos.x86_64                  24/69 ",
        "  Verifying  : samba-libs-4.10.4-11.el7_8.x86_64                          25/69 ",
        "  Verifying  : 1:grub2-tools-minimal-2.02-0.86.el7.centos.x86_64          26/69 ",
        "  Verifying  : open-vm-tools-10.3.10-2.el7_8.1.x86_64                     27/69 ",
        "  Verifying  : samba-common-4.10.4-11.el7_8.noarch                        28/69 ",
        "  Verifying  : 1:grub2-tools-extra-2.02-0.86.el7.centos.x86_64            29/69 ",
        "  Verifying  : selinux-policy-targeted-3.13.1-266.el7_8.1.noarch          30/69 ",
        "  Verifying  : libcurl-7.29.0-57.el7_8.1.x86_64                           31/69 ",
        "  Verifying  : samba-common-libs-4.10.4-11.el7_8.x86_64                   32/69 ",
        "  Verifying  : 1:nfs-utils-1.3.0-0.66.el7_8.x86_64                        33/69 ",
        "  Verifying  : kernel-3.10.0-1127.19.1.el7.x86_64                         34/69 ",
        "  Verifying  : 1:grub2-pc-modules-2.02-0.86.el7.centos.noarch             35/69 ",
        "  Verifying  : rsyslog-8.24.0-52.el7.x86_64                               36/69 ",
        "  Verifying  : 1:grub2-2.02-0.81.el7.centos.x86_64                        37/69 ",
        "  Verifying  : 1:grub2-tools-2.02-0.81.el7.centos.x86_64                  38/69 ",
        "  Verifying  : 1:grub2-common-2.02-0.81.el7.centos.noarch                 39/69 ",
        "  Verifying  : 1:grub2-pc-2.02-0.81.el7.centos.x86_64                     40/69 ",
        "  Verifying  : systemd-219-73.el7_8.5.x86_64                              41/69 ",
        "  Verifying  : 32:bind-export-libs-9.11.4-16.P2.el7_8.2.x86_64            42/69 ",
        "  Verifying  : libcurl-7.29.0-57.el7.x86_64                               43/69 ",
        "  Verifying  : curl-7.29.0-57.el7.x86_64                                  44/69 ",
        "  Verifying  : samba-common-4.10.4-10.el7.noarch                          45/69 ",
        "  Verifying  : 7:device-mapper-libs-1.02.164-7.el7_8.1.x86_64             46/69 ",
        "  Verifying  : ca-certificates-2019.2.32-76.el7_7.noarch                  47/69 ",
        "  Verifying  : samba-common-libs-4.10.4-10.el7.x86_64                     48/69 ",
        "  Verifying  : samba-libs-4.10.4-10.el7.x86_64                            49/69 ",
        "  Verifying  : libwbclient-4.10.4-10.el7.x86_64                           50/69 ",
        "  Verifying  : systemd-sysv-219-73.el7_8.5.x86_64                         51/69 ",
        "  Verifying  : selinux-policy-3.13.1-266.el7.noarch                       52/69 ",
        "  Verifying  : 1:dbus-libs-1.10.24-13.el7_6.x86_64                        53/69 ",
        "  Verifying  : binutils-2.27-43.base.el7.x86_64                           54/69 ",
        "  Verifying  : 1:dbus-1.10.24-13.el7_6.x86_64                             55/69 ",
        "  Verifying  : 7:device-mapper-1.02.164-7.el7_8.1.x86_64                  56/69 ",
        "  Verifying  : kernel-tools-3.10.0-1127.el7.x86_64                        57/69 ",
        "  Verifying  : kernel-tools-libs-3.10.0-1127.el7.x86_64                   58/69 ",
        "  Verifying  : 1:nfs-utils-1.3.0-0.66.el7.x86_64                          59/69 ",
        "  Verifying  : 1:grub2-pc-modules-2.02-0.81.el7.centos.noarch             60/69 ",
        "  Verifying  : selinux-policy-targeted-3.13.1-266.el7.noarch              61/69 ",
        "  Verifying  : samba-client-libs-4.10.4-10.el7.x86_64                     62/69 ",
        "  Verifying  : python-perf-3.10.0-1127.el7.x86_64                         63/69 ",
        "  Verifying  : 1:grub2-tools-minimal-2.02-0.81.el7.centos.x86_64          64/69 ",
        "  Verifying  : 1:grub2-tools-extra-2.02-0.81.el7.centos.x86_64            65/69 ",
        "  Verifying  : open-vm-tools-10.3.10-2.el7.x86_64                         66/69 ",
        "  Verifying  : systemd-libs-219-73.el7_8.5.x86_64                         67/69 ",
        "  Verifying  : yum-utils-1.1.31-53.el7.noarch                             68/69 ",
        "  Verifying  : yum-plugin-fastestmirror-1.1.31-53.el7.noarch              69/69 ",
        "",
        "Installed:",
        "  kernel.x86_64 0:3.10.0-1127.19.1.el7                                          ",
        "",
        "Updated:",
        "  bind-export-libs.x86_64 32:9.11.4-16.P2.el7_8.6                               ",
        "  binutils.x86_64 0:2.27-43.base.el7_8.1                                        ",
        "  ca-certificates.noarch 0:2020.2.41-70.0.el7_8                                 ",
        "  curl.x86_64 0:7.29.0-57.el7_8.1                                               ",
        "  dbus.x86_64 1:1.10.24-14.el7_8                                                ",
        "  dbus-libs.x86_64 1:1.10.24-14.el7_8                                           ",
        "  device-mapper.x86_64 7:1.02.164-7.el7_8.2                                     ",
        "  device-mapper-libs.x86_64 7:1.02.164-7.el7_8.2                                ",
        "  grub2.x86_64 1:2.02-0.86.el7.centos                                           ",
        "  grub2-common.noarch 1:2.02-0.86.el7.centos                                    ",
        "  grub2-pc.x86_64 1:2.02-0.86.el7.centos                                        ",
        "  grub2-pc-modules.noarch 1:2.02-0.86.el7.centos                                ",
        "  grub2-tools.x86_64 1:2.02-0.86.el7.centos                                     ",
        "  grub2-tools-extra.x86_64 1:2.02-0.86.el7.centos                               ",
        "  grub2-tools-minimal.x86_64 1:2.02-0.86.el7.centos                             ",
        "  kernel-tools.x86_64 0:3.10.0-1127.19.1.el7                                    ",
        "  kernel-tools-libs.x86_64 0:3.10.0-1127.19.1.el7                               ",
        "  libcurl.x86_64 0:7.29.0-57.el7_8.1                                            ",
        "  libwbclient.x86_64 0:4.10.4-11.el7_8                                          ",
        "  nfs-utils.x86_64 1:1.3.0-0.66.el7_8                                           ",
        "  open-vm-tools.x86_64 0:10.3.10-2.el7_8.1                                      ",
        "  python-perf.x86_64 0:3.10.0-1127.19.1.el7                                     ",
        "  rsyslog.x86_64 0:8.24.0-52.el7_8.2                                            ",
        "  samba-client-libs.x86_64 0:4.10.4-11.el7_8                                    ",
        "  samba-common.noarch 0:4.10.4-11.el7_8                                         ",
        "  samba-common-libs.x86_64 0:4.10.4-11.el7_8                                    ",
        "  samba-libs.x86_64 0:4.10.4-11.el7_8                                           ",
        "  selinux-policy.noarch 0:3.13.1-266.el7_8.1                                    ",
        "  selinux-policy-targeted.noarch 0:3.13.1-266.el7_8.1                           ",
        "  systemd.x86_64 0:219-73.el7_8.9                                               ",
        "  systemd-libs.x86_64 0:219-73.el7_8.9                                          ",
        "  systemd-sysv.x86_64 0:219-73.el7_8.9                                          ",
        "  yum-plugin-fastestmirror.noarch 0:1.1.31-54.el7_8                             ",
        "  yum-utils.noarch 0:1.1.31-54.el7_8                                            ",
        "",
        "Complete!"
    ]
}
192.168.100.11 | FAILED! => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "ansible_job_id": "943916355049.2087",
    "changed": false,
    "finished": 1,
    "msg": "could not find job",
    "started": 1
}
192.168.100.12 | FAILED! => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "ansible_job_id": "943916355049.2087",
    "changed": false,
    "finished": 1,
    "msg": "could not find job",
    "started": 1
}
```

## Check Log Files

- Check out the last few lines of the `messages` log file on all servers

```console
❯ ansible multi -b -a "tail /var/log/messages"
192.168.100.10 | CHANGED | rc=0 >>
Sep  9 16:35:36 app1 systemd-logind: Removed session 3.
Sep  9 16:35:36 app1 systemd: Removed slice User Slice of vagrant.
Sep  9 16:39:44 app1 systemd: Starting Cleanup of Temporary Directories...
Sep  9 16:39:44 app1 systemd: Started Cleanup of Temporary Directories.
Sep  9 17:01:01 app1 systemd: Created slice User Slice of root.
Sep  9 17:01:01 app1 systemd: Started Session 4 of user root.
Sep  9 17:26:56 app1 systemd: Created slice User Slice of vagrant.
Sep  9 17:26:56 app1 systemd: Started Session 5 of user vagrant.
Sep  9 17:26:56 app1 systemd-logind: New session 5 of user vagrant.
Sep  9 17:26:56 app1 ansible-command: Invoked with creates=None executable=None _uses_shell=False strip_empty_ends=True _raw_params=tail /var/log/messages removes=None argv=None warn=True chdir=None stdin_add_newline=True stdin=None
192.168.100.11 | CHANGED | rc=0 >>
Sep  9 16:35:36 app2 systemd: Removed slice User Slice of vagrant.
Sep  9 16:37:49 app2 chronyd[371]: Selected source 192.81.135.252
Sep  9 16:40:15 app2 systemd: Starting Cleanup of Temporary Directories...
Sep  9 16:40:15 app2 systemd: Started Cleanup of Temporary Directories.
Sep  9 17:01:01 app2 systemd: Created slice User Slice of root.
Sep  9 17:01:01 app2 systemd: Started Session 4 of user root.
Sep  9 17:26:56 app2 systemd: Created slice User Slice of vagrant.
Sep  9 17:26:56 app2 systemd: Started Session 5 of user vagrant.
Sep  9 17:26:56 app2 systemd-logind: New session 5 of user vagrant.
Sep  9 17:26:56 app2 ansible-command: Invoked with creates=None executable=None _uses_shell=False strip_empty_ends=True _raw_params=tail /var/log/messages removes=None argv=None warn=True chdir=None stdin_add_newline=True stdin=None
192.168.100.12 | CHANGED | rc=0 >>
Sep  9 16:35:37 db1 systemd: Removed slice User Slice of vagrant.
Sep  9 16:40:11 db1 systemd: Starting Cleanup of Temporary Directories...
Sep  9 16:40:11 db1 systemd: Started Cleanup of Temporary Directories.
Sep  9 17:01:01 db1 systemd: Created slice User Slice of root.
Sep  9 17:01:01 db1 systemd: Started Session 4 of user root.
Sep  9 17:08:02 db1 systemd: Removed slice User Slice of root.
Sep  9 17:26:56 db1 systemd: Created slice User Slice of vagrant.
Sep  9 17:26:56 db1 systemd: Started Session 5 of user vagrant.
Sep  9 17:26:56 db1 systemd-logind: New session 5 of user vagrant.
Sep  9 17:26:56 db1 ansible-command: Invoked with creates=None executable=None _uses_shell=False strip_empty_ends=True _raw_params=tail /var/log/messages removes=None argv=None warn=True chdir=None stdin_add_newline=True stdin=None
```

- Filter the messages log with `grep`, using the `shell` module

```console
❯ ansible multi -b -m shell -a "tail /var/log/messages | grep ansible-command | wc -l"
192.168.100.11 | CHANGED | rc=0 >>
7
192.168.100.12 | CHANGED | rc=0 >>
7
192.168.100.10 | CHANGED | rc=0 >>
7
```

## Manage Cron Jobs

- Set a cron job to run a script every day at 4am on all servers
  - The script was previously copied to all servers with execute permissions

```console
❯ ansible multi -b -m cron -a "name='show-date-4am' hour=4 job=/tmp/show_date.sh"
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "envs": [],
    "jobs": [
        "show-date-4am"
    ]
}
192.168.100.11 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "envs": [],
    "jobs": [
        "show-date-4am"
    ]
}
192.168.100.12 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "envs": [],
    "jobs": [
        "show-date-4am"
    ]
}
```

- Remove the cron job

```console
❯ ansible multi -b -m cron -a "name='show-date-4am' state=absent"
192.168.100.11 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "envs": [],
    "jobs": []
}
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "envs": [],
    "jobs": []
}
192.168.100.12 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "envs": [],
    "jobs": []
}
```
