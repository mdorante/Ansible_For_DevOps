# Using Ansible Modules

- Install NTP on all `multi` servers
  - NOTE: `-b` passes `become: true`, which basically just runs commands with `sudo`

```console
❯ ansible multi -b -m yum -a "name=ntp state=present"
192.168.100.12 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "changes": {
        "installed": [
            "ntp"
        ]
    },
    "msg": "warning: /var/cache/yum/x86_64/7/updates/packages/ntp-4.2.6p5-29.el7.centos.2.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY\nImporting GPG key 0xF4A80EB5:\n Userid     : \"CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>\"\n Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5\n Package    : centos-release-7-8.2003.0.el7.centos.x86_64 (@anaconda)\n From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\n",
    "rc": 0,
    "results": [
        "Loaded plugins: fastestmirror\nDetermining fastest mirrors\n * base: mirror.netglobalis.net\n * extras: mirror.netglobalis.net\n * updates: mirror.netglobalis.net\nResolving Dependencies\n--> Running transaction check\n---> Package ntp.x86_64 0:4.2.6p5-29.el7.centos.2 will be installed\n--> Processing Dependency: ntpdate = 4.2.6p5-29.el7.centos.2 for package: ntp-4.2.6p5-29.el7.centos.2.x86_64\n--> Processing Dependency: libopts.so.25()(64bit) for package: ntp-4.2.6p5-29.el7.centos.2.x86_64\n--> Running transaction check\n---> Package autogen-libopts.x86_64 0:5.18-5.el7 will be installed\n---> Package ntpdate.x86_64 0:4.2.6p5-29.el7.centos.2 will be installed\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package             Arch       Version                       Repository   Size\n================================================================================\nInstalling:\n ntp                 x86_64     4.2.6p5-29.el7.centos.2       updates     549 k\nInstalling for dependencies:\n autogen-libopts     x86_64     5.18-5.el7                    base         66 k\n ntpdate             x86_64     4.2.6p5-29.el7.centos.2       updates      87 k\n\nTransaction Summary\n================================================================================\nInstall  1 Package (+2 Dependent packages)\n\nTotal download size: 701 k\nInstalled size: 1.6 M\nDownloading packages:\nPublic key for ntp-4.2.6p5-29.el7.centos.2.x86_64.rpm is not installed\nPublic key for autogen-libopts-5.18-5.el7.x86_64.rpm is not installed\n--------------------------------------------------------------------------------\nTotal                                              804 kB/s | 701 kB  00:00     \nRetrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Installing : autogen-libopts-5.18-5.el7.x86_64                            1/3 \n  Installing : ntpdate-4.2.6p5-29.el7.centos.2.x86_64                       2/3 \n  Installing : ntp-4.2.6p5-29.el7.centos.2.x86_64                           3/3 \n  Verifying  : ntpdate-4.2.6p5-29.el7.centos.2.x86_64                       1/3 \n  Verifying  : ntp-4.2.6p5-29.el7.centos.2.x86_64                           2/3 \n  Verifying  : autogen-libopts-5.18-5.el7.x86_64                            3/3 \n\nInstalled:\n  ntp.x86_64 0:4.2.6p5-29.el7.centos.2                                          \n\nDependency Installed:\n  autogen-libopts.x86_64 0:5.18-5.el7  ntpdate.x86_64 0:4.2.6p5-29.el7.centos.2 \n\nComplete!\n"
    ]
}
192.168.100.11 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "changes": {
        "installed": [
            "ntp"
        ]
    },
    "msg": "warning: /var/cache/yum/x86_64/7/updates/packages/ntpdate-4.2.6p5-29.el7.centos.2.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY\nImporting GPG key 0xF4A80EB5:\n Userid     : \"CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>\"\n Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5\n Package    : centos-release-7-8.2003.0.el7.centos.x86_64 (@anaconda)\n From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\n",
    "rc": 0,
    "results": [
        "Loaded plugins: fastestmirror\nDetermining fastest mirrors\n * base: centos.ufes.br\n * extras: mirror-centos-jpa.hostdime.com.br\n * updates: centos.ufes.br\nResolving Dependencies\n--> Running transaction check\n---> Package ntp.x86_64 0:4.2.6p5-29.el7.centos.2 will be installed\n--> Processing Dependency: ntpdate = 4.2.6p5-29.el7.centos.2 for package: ntp-4.2.6p5-29.el7.centos.2.x86_64\n--> Processing Dependency: libopts.so.25()(64bit) for package: ntp-4.2.6p5-29.el7.centos.2.x86_64\n--> Running transaction check\n---> Package autogen-libopts.x86_64 0:5.18-5.el7 will be installed\n---> Package ntpdate.x86_64 0:4.2.6p5-29.el7.centos.2 will be installed\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package             Arch       Version                       Repository   Size\n================================================================================\nInstalling:\n ntp                 x86_64     4.2.6p5-29.el7.centos.2       updates     549 k\nInstalling for dependencies:\n autogen-libopts     x86_64     5.18-5.el7                    base         66 k\n ntpdate             x86_64     4.2.6p5-29.el7.centos.2       updates      87 k\n\nTransaction Summary\n================================================================================\nInstall  1 Package (+2 Dependent packages)\n\nTotal download size: 701 k\nInstalled size: 1.6 M\nDownloading packages:\nPublic key for ntpdate-4.2.6p5-29.el7.centos.2.x86_64.rpm is not installed\nPublic key for autogen-libopts-5.18-5.el7.x86_64.rpm is not installed\n--------------------------------------------------------------------------------\nTotal                                              879 kB/s | 701 kB  00:00     \nRetrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Installing : autogen-libopts-5.18-5.el7.x86_64                            1/3 \n  Installing : ntpdate-4.2.6p5-29.el7.centos.2.x86_64                       2/3 \n  Installing : ntp-4.2.6p5-29.el7.centos.2.x86_64                           3/3 \n  Verifying  : ntpdate-4.2.6p5-29.el7.centos.2.x86_64                       1/3 \n  Verifying  : ntp-4.2.6p5-29.el7.centos.2.x86_64                           2/3 \n  Verifying  : autogen-libopts-5.18-5.el7.x86_64                            3/3 \n\nInstalled:\n  ntp.x86_64 0:4.2.6p5-29.el7.centos.2                                          \n\nDependency Installed:\n  autogen-libopts.x86_64 0:5.18-5.el7  ntpdate.x86_64 0:4.2.6p5-29.el7.centos.2 \n\nComplete!\n"
    ]
}
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "changes": {
        "installed": [
            "ntp"
        ]
    },
    "msg": "warning: /var/cache/yum/x86_64/7/base/packages/autogen-libopts-5.18-5.el7.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY\nImporting GPG key 0xF4A80EB5:\n Userid     : \"CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>\"\n Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5\n Package    : centos-release-7-8.2003.0.el7.centos.x86_64 (@anaconda)\n From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\n",
    "rc": 0,
    "results": [
        "Loaded plugins: fastestmirror\nDetermining fastest mirrors\n * base: centos.mirror.py\n * extras: centos.mirror.py\n * updates: centos.mirror.py\nResolving Dependencies\n--> Running transaction check\n---> Package ntp.x86_64 0:4.2.6p5-29.el7.centos.2 will be installed\n--> Processing Dependency: ntpdate = 4.2.6p5-29.el7.centos.2 for package: ntp-4.2.6p5-29.el7.centos.2.x86_64\n--> Processing Dependency: libopts.so.25()(64bit) for package: ntp-4.2.6p5-29.el7.centos.2.x86_64\n--> Running transaction check\n---> Package autogen-libopts.x86_64 0:5.18-5.el7 will be installed\n---> Package ntpdate.x86_64 0:4.2.6p5-29.el7.centos.2 will be installed\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package             Arch       Version                       Repository   Size\n================================================================================\nInstalling:\n ntp                 x86_64     4.2.6p5-29.el7.centos.2       updates     549 k\nInstalling for dependencies:\n autogen-libopts     x86_64     5.18-5.el7                    base         66 k\n ntpdate             x86_64     4.2.6p5-29.el7.centos.2       updates      87 k\n\nTransaction Summary\n================================================================================\nInstall  1 Package (+2 Dependent packages)\n\nTotal download size: 701 k\nInstalled size: 1.6 M\nDownloading packages:\nPublic key for autogen-libopts-5.18-5.el7.x86_64.rpm is not installed\nPublic key for ntpdate-4.2.6p5-29.el7.centos.2.x86_64.rpm is not installed\n--------------------------------------------------------------------------------\nTotal                                              1.0 MB/s | 701 kB  00:00     \nRetrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Installing : autogen-libopts-5.18-5.el7.x86_64                            1/3 \n  Installing : ntpdate-4.2.6p5-29.el7.centos.2.x86_64                       2/3 \n  Installing : ntp-4.2.6p5-29.el7.centos.2.x86_64                           3/3 \n  Verifying  : ntpdate-4.2.6p5-29.el7.centos.2.x86_64                       1/3 \n  Verifying  : ntp-4.2.6p5-29.el7.centos.2.x86_64                           2/3 \n  Verifying  : autogen-libopts-5.18-5.el7.x86_64                            3/3 \n\nInstalled:\n  ntp.x86_64 0:4.2.6p5-29.el7.centos.2                                          \n\nDependency Installed:\n  autogen-libopts.x86_64 0:5.18-5.el7  ntpdate.x86_64 0:4.2.6p5-29.el7.centos.2 \n\nComplete!\n"
    ]
}
```

- Running the command a second time

```console
❯ ansible multi -b -m yum -a "name=ntp state=present"
192.168.100.11 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "msg": "",
    "rc": 0,
    "results": [
        "ntp-4.2.6p5-29.el7.centos.2.x86_64 providing ntp is already installed"
    ]
}
192.168.100.10 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "msg": "",
    "rc": 0,
    "results": [
        "ntp-4.2.6p5-29.el7.centos.2.x86_64 providing ntp is already installed"
    ]
}
192.168.100.12 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "msg": "",
    "rc": 0,
    "results": [
        "ntp-4.2.6p5-29.el7.centos.2.x86_64 providing ntp is already installed"
    ]
}
```

- Make sure NTP is started and enabled

```console
❯ ansible multi -b -m service -a "name=ntpd state=started enabled=yes"
192.168.100.12 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "enabled": true,
    "name": "ntpd",
    "state": "started",
    "status": {
        "ActiveEnterTimestampMonotonic": "0",
        "ActiveExitTimestampMonotonic": "0",
        "ActiveState": "inactive",
        "After": "ntpdate.service sntp.service -.mount systemd-journald.socket basic.target syslog.target tmp.mount system.slice",
        "AllowIsolate": "no",
        "AmbientCapabilities": "0",
        "AssertResult": "no",
        "AssertTimestampMonotonic": "0",
        "Before": "shutdown.target chronyd.service",
        "BlockIOAccounting": "no",
        "BlockIOWeight": "18446744073709551615",
        "CPUAccounting": "no",
        "CPUQuotaPerSecUSec": "infinity",
        "CPUSchedulingPolicy": "0",
        "CPUSchedulingPriority": "0",
        "CPUSchedulingResetOnFork": "no",
        "CPUShares": "18446744073709551615",
        "CanIsolate": "no",
        "CanReload": "no",
        "CanStart": "yes",
        "CanStop": "yes",
        "CapabilityBoundingSet": "18446744073709551615",
        "ConditionResult": "no",
        "ConditionTimestampMonotonic": "0",
        "ConflictedBy": "chronyd.service",
        "Conflicts": "shutdown.target",
        "ControlPID": "0",
        "DefaultDependencies": "yes",
        "Delegate": "no",
        "Description": "Network Time Service",
        "DevicePolicy": "auto",
        "EnvironmentFile": "/etc/sysconfig/ntpd (ignore_errors=yes)",
        "ExecMainCode": "0",
        "ExecMainExitTimestampMonotonic": "0",
        "ExecMainPID": "0",
        "ExecMainStartTimestampMonotonic": "0",
        "ExecMainStatus": "0",
        "ExecStart": "{ path=/usr/sbin/ntpd ; argv[]=/usr/sbin/ntpd -u ntp:ntp $OPTIONS ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "FailureAction": "none",
        "FileDescriptorStoreMax": "0",
        "FragmentPath": "/usr/lib/systemd/system/ntpd.service",
        "GuessMainPID": "yes",
        "IOScheduling": "0",
        "Id": "ntpd.service",
        "IgnoreOnIsolate": "no",
        "IgnoreOnSnapshot": "no",
        "IgnoreSIGPIPE": "yes",
        "InactiveEnterTimestampMonotonic": "0",
        "InactiveExitTimestampMonotonic": "0",
        "JobTimeoutAction": "none",
        "JobTimeoutUSec": "0",
        "KillMode": "control-group",
        "KillSignal": "15",
        "LimitAS": "18446744073709551615",
        "LimitCORE": "18446744073709551615",
        "LimitCPU": "18446744073709551615",
        "LimitDATA": "18446744073709551615",
        "LimitFSIZE": "18446744073709551615",
        "LimitLOCKS": "18446744073709551615",
        "LimitMEMLOCK": "65536",
        "LimitMSGQUEUE": "819200",
        "LimitNICE": "0",
        "LimitNOFILE": "4096",
        "LimitNPROC": "881",
        "LimitRSS": "18446744073709551615",
        "LimitRTPRIO": "0",
        "LimitRTTIME": "18446744073709551615",
        "LimitSIGPENDING": "881",
        "LimitSTACK": "18446744073709551615",
        "LoadState": "loaded",
        "MainPID": "0",
        "MemoryAccounting": "no",
        "MemoryCurrent": "18446744073709551615",
        "MemoryLimit": "18446744073709551615",
        "MountFlags": "0",
        "Names": "ntpd.service",
        "NeedDaemonReload": "no",
        "Nice": "0",
        "NoNewPrivileges": "no",
        "NonBlocking": "no",
        "NotifyAccess": "none",
        "OOMScoreAdjust": "0",
        "OnFailureJobMode": "replace",
        "PermissionsStartOnly": "no",
        "PrivateDevices": "no",
        "PrivateNetwork": "no",
        "PrivateTmp": "yes",
        "ProtectHome": "no",
        "ProtectSystem": "no",
        "RefuseManualStart": "no",
        "RefuseManualStop": "no",
        "RemainAfterExit": "no",
        "Requires": "basic.target system.slice -.mount",
        "RequiresMountsFor": "/var/tmp",
        "Restart": "no",
        "RestartUSec": "100ms",
        "Result": "success",
        "RootDirectoryStartOnly": "no",
        "RuntimeDirectoryMode": "0755",
        "SameProcessGroup": "no",
        "SecureBits": "0",
        "SendSIGHUP": "no",
        "SendSIGKILL": "yes",
        "Slice": "system.slice",
        "StandardError": "inherit",
        "StandardInput": "null",
        "StandardOutput": "journal",
        "StartLimitAction": "none",
        "StartLimitBurst": "5",
        "StartLimitInterval": "10000000",
        "StartupBlockIOWeight": "18446744073709551615",
        "StartupCPUShares": "18446744073709551615",
        "StatusErrno": "0",
        "StopWhenUnneeded": "no",
        "SubState": "dead",
        "SyslogLevelPrefix": "yes",
        "SyslogPriority": "30",
        "SystemCallErrorNumber": "0",
        "TTYReset": "no",
        "TTYVHangup": "no",
        "TTYVTDisallocate": "no",
        "TasksAccounting": "no",
        "TasksCurrent": "18446744073709551615",
        "TasksMax": "18446744073709551615",
        "TimeoutStartUSec": "1min 30s",
        "TimeoutStopUSec": "1min 30s",
        "TimerSlackNSec": "50000",
        "Transient": "no",
        "Type": "forking",
        "UMask": "0022",
        "UnitFilePreset": "disabled",
        "UnitFileState": "disabled",
        "WatchdogTimestampMonotonic": "0",
        "WatchdogUSec": "0"
    }
}
192.168.100.11 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "enabled": true,
    "name": "ntpd",
    "state": "started",
    "status": {
        "ActiveEnterTimestampMonotonic": "0",
        "ActiveExitTimestampMonotonic": "0",
        "ActiveState": "inactive",
        "After": "systemd-journald.socket -.mount syslog.target system.slice tmp.mount sntp.service basic.target ntpdate.service",
        "AllowIsolate": "no",
        "AmbientCapabilities": "0",
        "AssertResult": "no",
        "AssertTimestampMonotonic": "0",
        "Before": "shutdown.target chronyd.service",
        "BlockIOAccounting": "no",
        "BlockIOWeight": "18446744073709551615",
        "CPUAccounting": "no",
        "CPUQuotaPerSecUSec": "infinity",
        "CPUSchedulingPolicy": "0",
        "CPUSchedulingPriority": "0",
        "CPUSchedulingResetOnFork": "no",
        "CPUShares": "18446744073709551615",
        "CanIsolate": "no",
        "CanReload": "no",
        "CanStart": "yes",
        "CanStop": "yes",
        "CapabilityBoundingSet": "18446744073709551615",
        "ConditionResult": "no",
        "ConditionTimestampMonotonic": "0",
        "ConflictedBy": "chronyd.service",
        "Conflicts": "shutdown.target",
        "ControlPID": "0",
        "DefaultDependencies": "yes",
        "Delegate": "no",
        "Description": "Network Time Service",
        "DevicePolicy": "auto",
        "EnvironmentFile": "/etc/sysconfig/ntpd (ignore_errors=yes)",
        "ExecMainCode": "0",
        "ExecMainExitTimestampMonotonic": "0",
        "ExecMainPID": "0",
        "ExecMainStartTimestampMonotonic": "0",
        "ExecMainStatus": "0",
        "ExecStart": "{ path=/usr/sbin/ntpd ; argv[]=/usr/sbin/ntpd -u ntp:ntp $OPTIONS ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "FailureAction": "none",
        "FileDescriptorStoreMax": "0",
        "FragmentPath": "/usr/lib/systemd/system/ntpd.service",
        "GuessMainPID": "yes",
        "IOScheduling": "0",
        "Id": "ntpd.service",
        "IgnoreOnIsolate": "no",
        "IgnoreOnSnapshot": "no",
        "IgnoreSIGPIPE": "yes",
        "InactiveEnterTimestampMonotonic": "0",
        "InactiveExitTimestampMonotonic": "0",
        "JobTimeoutAction": "none",
        "JobTimeoutUSec": "0",
        "KillMode": "control-group",
        "KillSignal": "15",
        "LimitAS": "18446744073709551615",
        "LimitCORE": "18446744073709551615",
        "LimitCPU": "18446744073709551615",
        "LimitDATA": "18446744073709551615",
        "LimitFSIZE": "18446744073709551615",
        "LimitLOCKS": "18446744073709551615",
        "LimitMEMLOCK": "65536",
        "LimitMSGQUEUE": "819200",
        "LimitNICE": "0",
        "LimitNOFILE": "4096",
        "LimitNPROC": "881",
        "LimitRSS": "18446744073709551615",
        "LimitRTPRIO": "0",
        "LimitRTTIME": "18446744073709551615",
        "LimitSIGPENDING": "881",
        "LimitSTACK": "18446744073709551615",
        "LoadState": "loaded",
        "MainPID": "0",
        "MemoryAccounting": "no",
        "MemoryCurrent": "18446744073709551615",
        "MemoryLimit": "18446744073709551615",
        "MountFlags": "0",
        "Names": "ntpd.service",
        "NeedDaemonReload": "no",
        "Nice": "0",
        "NoNewPrivileges": "no",
        "NonBlocking": "no",
        "NotifyAccess": "none",
        "OOMScoreAdjust": "0",
        "OnFailureJobMode": "replace",
        "PermissionsStartOnly": "no",
        "PrivateDevices": "no",
        "PrivateNetwork": "no",
        "PrivateTmp": "yes",
        "ProtectHome": "no",
        "ProtectSystem": "no",
        "RefuseManualStart": "no",
        "RefuseManualStop": "no",
        "RemainAfterExit": "no",
        "Requires": "system.slice -.mount basic.target",
        "RequiresMountsFor": "/var/tmp",
        "Restart": "no",
        "RestartUSec": "100ms",
        "Result": "success",
        "RootDirectoryStartOnly": "no",
        "RuntimeDirectoryMode": "0755",
        "SameProcessGroup": "no",
        "SecureBits": "0",
        "SendSIGHUP": "no",
        "SendSIGKILL": "yes",
        "Slice": "system.slice",
        "StandardError": "inherit",
        "StandardInput": "null",
        "StandardOutput": "journal",
        "StartLimitAction": "none",
        "StartLimitBurst": "5",
        "StartLimitInterval": "10000000",
        "StartupBlockIOWeight": "18446744073709551615",
        "StartupCPUShares": "18446744073709551615",
        "StatusErrno": "0",
        "StopWhenUnneeded": "no",
        "SubState": "dead",
        "SyslogLevelPrefix": "yes",
        "SyslogPriority": "30",
        "SystemCallErrorNumber": "0",
        "TTYReset": "no",
        "TTYVHangup": "no",
        "TTYVTDisallocate": "no",
        "TasksAccounting": "no",
        "TasksCurrent": "18446744073709551615",
        "TasksMax": "18446744073709551615",
        "TimeoutStartUSec": "1min 30s",
        "TimeoutStopUSec": "1min 30s",
        "TimerSlackNSec": "50000",
        "Transient": "no",
        "Type": "forking",
        "UMask": "0022",
        "UnitFilePreset": "disabled",
        "UnitFileState": "disabled",
        "WatchdogTimestampMonotonic": "0",
        "WatchdogUSec": "0"
    }
}
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "enabled": true,
    "name": "ntpd",
    "state": "started",
    "status": {
        "ActiveEnterTimestampMonotonic": "0",
        "ActiveExitTimestampMonotonic": "0",
        "ActiveState": "inactive",
        "After": "sntp.service tmp.mount ntpdate.service systemd-journald.socket -.mount basic.target system.slice syslog.target",
        "AllowIsolate": "no",
        "AmbientCapabilities": "0",
        "AssertResult": "no",
        "AssertTimestampMonotonic": "0",
        "Before": "shutdown.target chronyd.service",
        "BlockIOAccounting": "no",
        "BlockIOWeight": "18446744073709551615",
        "CPUAccounting": "no",
        "CPUQuotaPerSecUSec": "infinity",
        "CPUSchedulingPolicy": "0",
        "CPUSchedulingPriority": "0",
        "CPUSchedulingResetOnFork": "no",
        "CPUShares": "18446744073709551615",
        "CanIsolate": "no",
        "CanReload": "no",
        "CanStart": "yes",
        "CanStop": "yes",
        "CapabilityBoundingSet": "18446744073709551615",
        "ConditionResult": "no",
        "ConditionTimestampMonotonic": "0",
        "ConflictedBy": "chronyd.service",
        "Conflicts": "shutdown.target",
        "ControlPID": "0",
        "DefaultDependencies": "yes",
        "Delegate": "no",
        "Description": "Network Time Service",
        "DevicePolicy": "auto",
        "EnvironmentFile": "/etc/sysconfig/ntpd (ignore_errors=yes)",
        "ExecMainCode": "0",
        "ExecMainExitTimestampMonotonic": "0",
        "ExecMainPID": "0",
        "ExecMainStartTimestampMonotonic": "0",
        "ExecMainStatus": "0",
        "ExecStart": "{ path=/usr/sbin/ntpd ; argv[]=/usr/sbin/ntpd -u ntp:ntp $OPTIONS ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "FailureAction": "none",
        "FileDescriptorStoreMax": "0",
        "FragmentPath": "/usr/lib/systemd/system/ntpd.service",
        "GuessMainPID": "yes",
        "IOScheduling": "0",
        "Id": "ntpd.service",
        "IgnoreOnIsolate": "no",
        "IgnoreOnSnapshot": "no",
        "IgnoreSIGPIPE": "yes",
        "InactiveEnterTimestampMonotonic": "0",
        "InactiveExitTimestampMonotonic": "0",
        "JobTimeoutAction": "none",
        "JobTimeoutUSec": "0",
        "KillMode": "control-group",
        "KillSignal": "15",
        "LimitAS": "18446744073709551615",
        "LimitCORE": "18446744073709551615",
        "LimitCPU": "18446744073709551615",
        "LimitDATA": "18446744073709551615",
        "LimitFSIZE": "18446744073709551615",
        "LimitLOCKS": "18446744073709551615",
        "LimitMEMLOCK": "65536",
        "LimitMSGQUEUE": "819200",
        "LimitNICE": "0",
        "LimitNOFILE": "4096",
        "LimitNPROC": "881",
        "LimitRSS": "18446744073709551615",
        "LimitRTPRIO": "0",
        "LimitRTTIME": "18446744073709551615",
        "LimitSIGPENDING": "881",
        "LimitSTACK": "18446744073709551615",
        "LoadState": "loaded",
        "MainPID": "0",
        "MemoryAccounting": "no",
        "MemoryCurrent": "18446744073709551615",
        "MemoryLimit": "18446744073709551615",
        "MountFlags": "0",
        "Names": "ntpd.service",
        "NeedDaemonReload": "no",
        "Nice": "0",
        "NoNewPrivileges": "no",
        "NonBlocking": "no",
        "NotifyAccess": "none",
        "OOMScoreAdjust": "0",
        "OnFailureJobMode": "replace",
        "PermissionsStartOnly": "no",
        "PrivateDevices": "no",
        "PrivateNetwork": "no",
        "PrivateTmp": "yes",
        "ProtectHome": "no",
        "ProtectSystem": "no",
        "RefuseManualStart": "no",
        "RefuseManualStop": "no",
        "RemainAfterExit": "no",
        "Requires": "-.mount system.slice basic.target",
        "RequiresMountsFor": "/var/tmp",
        "Restart": "no",
        "RestartUSec": "100ms",
        "Result": "success",
        "RootDirectoryStartOnly": "no",
        "RuntimeDirectoryMode": "0755",
        "SameProcessGroup": "no",
        "SecureBits": "0",
        "SendSIGHUP": "no",
        "SendSIGKILL": "yes",
        "Slice": "system.slice",
        "StandardError": "inherit",
        "StandardInput": "null",
        "StandardOutput": "journal",
        "StartLimitAction": "none",
        "StartLimitBurst": "5",
        "StartLimitInterval": "10000000",
        "StartupBlockIOWeight": "18446744073709551615",
        "StartupCPUShares": "18446744073709551615",
        "StatusErrno": "0",
        "StopWhenUnneeded": "no",
        "SubState": "dead",
        "SyslogLevelPrefix": "yes",
        "SyslogPriority": "30",
        "SystemCallErrorNumber": "0",
        "TTYReset": "no",
        "TTYVHangup": "no",
        "TTYVTDisallocate": "no",
        "TasksAccounting": "no",
        "TasksCurrent": "18446744073709551615",
        "TasksMax": "18446744073709551615",
        "TimeoutStartUSec": "1min 30s",
        "TimeoutStopUSec": "1min 30s",
        "TimerSlackNSec": "50000",
        "Transient": "no",
        "Type": "forking",
        "UMask": "0022",
        "UnitFilePreset": "disabled",
        "UnitFileState": "disabled",
        "WatchdogTimestampMonotonic": "0",
        "WatchdogUSec": "0"
    }
}
```

- Check if all servers are synced with the official NTP server

```console
❯ ansible multi -b -a "systemctl stop ntpd"
192.168.100.11 | CHANGED | rc=0 >>

192.168.100.12 | CHANGED | rc=0 >>

192.168.100.10 | CHANGED | rc=0 >>

❯ ansible multi -b -a "ntpdate -q 0.rhel.pool.ntp.org"
192.168.100.11 | CHANGED | rc=0 >>
server 12.167.151.1, stratum 3, offset -0.011161, delay 0.20844
server 4.53.160.75, stratum 2, offset -0.006008, delay 0.21539
server 66.228.58.20, stratum 3, offset -0.022761, delay 0.22588
server 159.203.82.102, stratum 4, offset -0.007175, delay 0.20885
 2 Sep 21:14:27 ntpdate[3296]: adjust time server 4.53.160.75 offset -0.006008 sec
192.168.100.10 | CHANGED | rc=0 >>
server 12.167.151.1, stratum 3, offset 0.023542, delay 0.20912
server 159.203.82.102, stratum 4, offset 0.035396, delay 0.19106
server 66.228.58.20, stratum 3, offset 0.017138, delay 0.22481
server 4.53.160.75, stratum 2, offset 0.030100, delay 0.21140
 2 Sep 21:14:27 ntpdate[3292]: adjust time server 4.53.160.75 offset 0.030100 sec
192.168.100.12 | CHANGED | rc=0 >>
server 159.203.82.102, stratum 4, offset 0.011041, delay 0.18987
server 66.228.58.20, stratum 3, offset -0.015559, delay 0.22340
server 4.53.160.75, stratum 2, offset 0.002309, delay 0.21408
server 12.167.151.1, stratum 3, offset -0.004606, delay 0.20883
 2 Sep 21:14:29 ntpdate[3524]: adjust time server 4.53.160.75 offset 0.002309 sec

❯ ansible multi -b -a "systemctl start ntpd"
192.168.100.11 | CHANGED | rc=0 >>

192.168.100.12 | CHANGED | rc=0 >>

192.168.100.10 | CHANGED | rc=0 >>

```
