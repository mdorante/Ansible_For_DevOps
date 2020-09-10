# Using Host Groups

## Configure the Application Servers

- Install Django

```console
❯ ansible app -b -m yum -a "name=MySQL-python state=latest"
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "changes": {
        "installed": [
            "MySQL-python"
        ],
        "updated": []
    },
    "msg": "",
    "rc": 0,
    "results": [
        "Loaded plugins: fastestmirror\nLoading mirror speeds from cached hostfile\n * base: centos.mirror.py\n * extras: centos.mirror.py\n * updates: centos.mirror.py\nResolving Dependencies\n--> Running transaction check\n---> Package MySQL-python.x86_64 0:1.2.5-1.el7 will be installed\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package               Arch            Version              Repository     Size\n================================================================================\nInstalling:\n MySQL-python          x86_64          1.2.5-1.el7          base           90 k\n\nTransaction Summary\n================================================================================\nInstall  1 Package\n\nTotal download size: 90 k\nInstalled size: 284 k\nDownloading packages:\nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Installing : MySQL-python-1.2.5-1.el7.x86_64                              1/1 \n  Verifying  : MySQL-python-1.2.5-1.el7.x86_64                              1/1 \n\nInstalled:\n  MySQL-python.x86_64 0:1.2.5-1.el7                                             \n\nComplete!\n"
    ]
}
192.168.100.11 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "changes": {
        "installed": [
            "MySQL-python"
        ],
        "updated": []
    },
    "msg": "",
    "rc": 0,
    "results": [
        "Loaded plugins: fastestmirror\nLoading mirror speeds from cached hostfile\n * base: centos.ufes.br\n * extras: mirror-centos-jpa.hostdime.com.br\n * updates: centos.ufes.br\nResolving Dependencies\n--> Running transaction check\n---> Package MySQL-python.x86_64 0:1.2.5-1.el7 will be installed\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package               Arch            Version              Repository     Size\n================================================================================\nInstalling:\n MySQL-python          x86_64          1.2.5-1.el7          base           90 k\n\nTransaction Summary\n================================================================================\nInstall  1 Package\n\nTotal download size: 90 k\nInstalled size: 284 k\nDownloading packages:\nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Installing : MySQL-python-1.2.5-1.el7.x86_64                              1/1 \n  Verifying  : MySQL-python-1.2.5-1.el7.x86_64                              1/1 \n\nInstalled:\n  MySQL-python.x86_64 0:1.2.5-1.el7                                             \n\nComplete!\n"
    ]
}

❯ ansible app -b -m yum -a "name=python-setuptools state=latest"
192.168.100.11 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "changes": {
        "installed": [
            "python-setuptools"
        ],
        "updated": []
    },
    "msg": "",
    "rc": 0,
    "results": [
        "Loaded plugins: fastestmirror\nLoading mirror speeds from cached hostfile\n * base: centos.ufes.br\n * extras: mirror-centos-jpa.hostdime.com.br\n * updates: centos.ufes.br\nResolving Dependencies\n--> Running transaction check\n---> Package python-setuptools.noarch 0:0.9.8-7.el7 will be installed\n--> Processing Dependency: python-backports-ssl_match_hostname for package: python-setuptools-0.9.8-7.el7.noarch\n--> Running transaction check\n---> Package python-backports-ssl_match_hostname.noarch 0:3.5.0.1-1.el7 will be installed\n--> Processing Dependency: python-ipaddress for package: python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch\n--> Processing Dependency: python-backports for package: python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch\n--> Running transaction check\n---> Package python-backports.x86_64 0:1.0-8.el7 will be installed\n---> Package python-ipaddress.noarch 0:1.0.16-2.el7 will be installed\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package                               Arch     Version            Repository\n                                                                           Size\n================================================================================\nInstalling:\n python-setuptools                     noarch   0.9.8-7.el7        base   397 k\nInstalling for dependencies:\n python-backports                      x86_64   1.0-8.el7          base   5.8 k\n python-backports-ssl_match_hostname   noarch   3.5.0.1-1.el7      base    13 k\n python-ipaddress                      noarch   1.0.16-2.el7       base    34 k\n\nTransaction Summary\n================================================================================\nInstall  1 Package (+3 Dependent packages)\n\nTotal download size: 450 k\nInstalled size: 2.2 M\nDownloading packages:\n--------------------------------------------------------------------------------\nTotal                                              251 kB/s | 450 kB  00:01     \nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Installing : python-backports-1.0-8.el7.x86_64                            1/4 \n  Installing : python-ipaddress-1.0.16-2.el7.noarch                         2/4 \n  Installing : python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch     3/4 \n  Installing : python-setuptools-0.9.8-7.el7.noarch                         4/4 \n  Verifying  : python-ipaddress-1.0.16-2.el7.noarch                         1/4 \n  Verifying  : python-setuptools-0.9.8-7.el7.noarch                         2/4 \n  Verifying  : python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch     3/4 \n  Verifying  : python-backports-1.0-8.el7.x86_64                            4/4 \n\nInstalled:\n  python-setuptools.noarch 0:0.9.8-7.el7                                        \n\nDependency Installed:\n  python-backports.x86_64 0:1.0-8.el7                                           \n  python-backports-ssl_match_hostname.noarch 0:3.5.0.1-1.el7                    \n  python-ipaddress.noarch 0:1.0.16-2.el7                                        \n\nComplete!\n"
    ]
}
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "changes": {
        "installed": [
            "python-setuptools"
        ],
        "updated": []
    },
    "msg": "",
    "rc": 0,
    "results": [
        "Loaded plugins: fastestmirror\nLoading mirror speeds from cached hostfile\n * base: centos.mirror.py\n * extras: centos.mirror.py\n * updates: centos.mirror.py\nResolving Dependencies\n--> Running transaction check\n---> Package python-setuptools.noarch 0:0.9.8-7.el7 will be installed\n--> Processing Dependency: python-backports-ssl_match_hostname for package: python-setuptools-0.9.8-7.el7.noarch\n--> Running transaction check\n---> Package python-backports-ssl_match_hostname.noarch 0:3.5.0.1-1.el7 will be installed\n--> Processing Dependency: python-ipaddress for package: python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch\n--> Processing Dependency: python-backports for package: python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch\n--> Running transaction check\n---> Package python-backports.x86_64 0:1.0-8.el7 will be installed\n---> Package python-ipaddress.noarch 0:1.0.16-2.el7 will be installed\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package                               Arch     Version            Repository\n                                                                           Size\n================================================================================\nInstalling:\n python-setuptools                     noarch   0.9.8-7.el7        base   397 k\nInstalling for dependencies:\n python-backports                      x86_64   1.0-8.el7          base   5.8 k\n python-backports-ssl_match_hostname   noarch   3.5.0.1-1.el7      base    13 k\n python-ipaddress                      noarch   1.0.16-2.el7       base    34 k\n\nTransaction Summary\n================================================================================\nInstall  1 Package (+3 Dependent packages)\n\nTotal download size: 450 k\nInstalled size: 2.2 M\nDownloading packages:\n--------------------------------------------------------------------------------\nTotal                                              226 kB/s | 450 kB  00:01     \nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Installing : python-backports-1.0-8.el7.x86_64                            1/4 \n  Installing : python-ipaddress-1.0.16-2.el7.noarch                         2/4 \n  Installing : python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch     3/4 \n  Installing : python-setuptools-0.9.8-7.el7.noarch                         4/4 \n  Verifying  : python-ipaddress-1.0.16-2.el7.noarch                         1/4 \n  Verifying  : python-setuptools-0.9.8-7.el7.noarch                         2/4 \n  Verifying  : python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch     3/4 \n  Verifying  : python-backports-1.0-8.el7.x86_64                            4/4 \n\nInstalled:\n  python-setuptools.noarch 0:0.9.8-7.el7                                        \n\nDependency Installed:\n  python-backports.x86_64 0:1.0-8.el7                                           \n  python-backports-ssl_match_hostname.noarch 0:3.5.0.1-1.el7                    \n  python-ipaddress.noarch 0:1.0.16-2.el7                                        \n\nComplete!\n"
    ]
}

❯ ansible app -b -m easy_install -a "name=django<2 state=latest"
192.168.100.10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "binary": "/bin/easy_install",
    "changed": true,
    "name": "django<2",
    "virtualenv": null
}
192.168.100.11 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "binary": "/bin/easy_install",
    "changed": true,
    "name": "django<2",
    "virtualenv": null
}
```

- Check if Django is installed and working correctly

```console
❯ ansible app -a "python -c 'import django; print django.get_version()'"
192.168.100.10 | CHANGED | rc=0 >>
1.11.29
192.168.100.11 | CHANGED | rc=0 >>
1.11.29
```

## Configure the Database Server

- Install, configure and start MariaDB

```console
❯ ansible db -b -m yum -a "name=mariadb-server state=latest"
192.168.100.12 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "changes": {
        "installed": [
            "mariadb-server"
        ],
        "updated": []
    },
    "msg": "http://mirror.netglobalis.net/centos/7.8.2003/os/x86_64/Packages/perl-5.16.3-295.el7.x86_64.rpm: [Errno 12] Timeout on http://mirror.netglobalis.net/centos/7.8.2003/os/x86_64/Packages/perl-5.16.3-295.el7.x86_64.rpm: (28, 'Operation too slow. Less than 1000 bytes/sec transferred the last 30 seconds')\nTrying other mirror.\n",
    "rc": 0,
    "results": [
        "Loaded plugins: fastestmirror\nLoading mirror speeds from cached hostfile\n * base: mirror.netglobalis.net\n * extras: mirror.netglobalis.net\n * updates: mirror.netglobalis.net\nResolving Dependencies\n--> Running transaction check\n---> Package mariadb-server.x86_64 1:5.5.65-1.el7 will be installed\n--> Processing Dependency: mariadb(x86-64) = 1:5.5.65-1.el7 for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: perl-DBI for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: perl-DBD-MySQL for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: perl(vars) for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: perl(strict) for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: perl(Sys::Hostname) for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: perl(POSIX) for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: perl(Getopt::Long) for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: perl(File::Temp) for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: perl(File::Path) for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: perl(File::Copy) for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: perl(File::Basename) for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: perl(Data::Dumper) for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: perl(DBI) for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: libaio.so.1(LIBAIO_0.4)(64bit) for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: libaio.so.1(LIBAIO_0.1)(64bit) for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: /usr/bin/perl for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Processing Dependency: libaio.so.1()(64bit) for package: 1:mariadb-server-5.5.65-1.el7.x86_64\n--> Running transaction check\n---> Package libaio.x86_64 0:0.3.109-13.el7 will be installed\n---> Package mariadb.x86_64 1:5.5.65-1.el7 will be installed\n--> Processing Dependency: perl(Exporter) for package: 1:mariadb-5.5.65-1.el7.x86_64\n---> Package perl.x86_64 4:5.16.3-295.el7 will be installed\n--> Processing Dependency: perl-libs = 4:5.16.3-295.el7 for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(Socket) >= 1.3 for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(Scalar::Util) >= 1.10 for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl-macros for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl-libs for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(threads::shared) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(threads) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(constant) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(Time::Local) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(Time::HiRes) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(Storable) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(Socket) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(Scalar::Util) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(Pod::Simple::XHTML) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(Pod::Simple::Search) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(Filter::Util::Call) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(File::Spec::Unix) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(File::Spec::Functions) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(File::Spec) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(Cwd) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: perl(Carp) for package: 4:perl-5.16.3-295.el7.x86_64\n--> Processing Dependency: libperl.so()(64bit) for package: 4:perl-5.16.3-295.el7.x86_64\n---> Package perl-DBD-MySQL.x86_64 0:4.023-6.el7 will be installed\n---> Package perl-DBI.x86_64 0:1.627-4.el7 will be installed\n--> Processing Dependency: perl(RPC::PlServer) >= 0.2001 for package: perl-DBI-1.627-4.el7.x86_64\n--> Processing Dependency: perl(RPC::PlClient) >= 0.2000 for package: perl-DBI-1.627-4.el7.x86_64\n---> Package perl-Data-Dumper.x86_64 0:2.145-3.el7 will be installed\n---> Package perl-File-Path.noarch 0:2.09-2.el7 will be installed\n---> Package perl-File-Temp.noarch 0:0.23.01-3.el7 will be installed\n---> Package perl-Getopt-Long.noarch 0:2.40-3.el7 will be installed\n--> Processing Dependency: perl(Pod::Usage) >= 1.14 for package: perl-Getopt-Long-2.40-3.el7.noarch\n--> Processing Dependency: perl(Text::ParseWords) for package: perl-Getopt-Long-2.40-3.el7.noarch\n--> Running transaction check\n---> Package perl-Carp.noarch 0:1.26-244.el7 will be installed\n---> Package perl-Exporter.noarch 0:5.68-3.el7 will be installed\n---> Package perl-Filter.x86_64 0:1.49-3.el7 will be installed\n---> Package perl-PathTools.x86_64 0:3.40-5.el7 will be installed\n---> Package perl-PlRPC.noarch 0:0.2020-14.el7 will be installed\n--> Processing Dependency: perl(Net::Daemon) >= 0.13 for package: perl-PlRPC-0.2020-14.el7.noarch\n--> Processing Dependency: perl(Net::Daemon::Test) for package: perl-PlRPC-0.2020-14.el7.noarch\n--> Processing Dependency: perl(Net::Daemon::Log) for package: perl-PlRPC-0.2020-14.el7.noarch\n--> Processing Dependency: perl(Compress::Zlib) for package: perl-PlRPC-0.2020-14.el7.noarch\n---> Package perl-Pod-Simple.noarch 1:3.28-4.el7 will be installed\n--> Processing Dependency: perl(Pod::Escapes) >= 1.04 for package: 1:perl-Pod-Simple-3.28-4.el7.noarch\n--> Processing Dependency: perl(Encode) for package: 1:perl-Pod-Simple-3.28-4.el7.noarch\n---> Package perl-Pod-Usage.noarch 0:1.63-3.el7 will be installed\n--> Processing Dependency: perl(Pod::Text) >= 3.15 for package: perl-Pod-Usage-1.63-3.el7.noarch\n--> Processing Dependency: perl-Pod-Perldoc for package: perl-Pod-Usage-1.63-3.el7.noarch\n---> Package perl-Scalar-List-Utils.x86_64 0:1.27-248.el7 will be installed\n---> Package perl-Socket.x86_64 0:2.010-5.el7 will be installed\n---> Package perl-Storable.x86_64 0:2.45-3.el7 will be installed\n---> Package perl-Text-ParseWords.noarch 0:3.29-4.el7 will be installed\n---> Package perl-Time-HiRes.x86_64 4:1.9725-3.el7 will be installed\n---> Package perl-Time-Local.noarch 0:1.2300-2.el7 will be installed\n---> Package perl-constant.noarch 0:1.27-2.el7 will be installed\n---> Package perl-libs.x86_64 4:5.16.3-295.el7 will be installed\n---> Package perl-macros.x86_64 4:5.16.3-295.el7 will be installed\n---> Package perl-threads.x86_64 0:1.87-4.el7 will be installed\n---> Package perl-threads-shared.x86_64 0:1.43-6.el7 will be installed\n--> Running transaction check\n---> Package perl-Encode.x86_64 0:2.51-7.el7 will be installed\n---> Package perl-IO-Compress.noarch 0:2.061-2.el7 will be installed\n--> Processing Dependency: perl(Compress::Raw::Zlib) >= 2.061 for package: perl-IO-Compress-2.061-2.el7.noarch\n--> Processing Dependency: perl(Compress::Raw::Bzip2) >= 2.061 for package: perl-IO-Compress-2.061-2.el7.noarch\n---> Package perl-Net-Daemon.noarch 0:0.48-5.el7 will be installed\n---> Package perl-Pod-Escapes.noarch 1:1.04-295.el7 will be installed\n---> Package perl-Pod-Perldoc.noarch 0:3.20-4.el7 will be installed\n--> Processing Dependency: perl(parent) for package: perl-Pod-Perldoc-3.20-4.el7.noarch\n--> Processing Dependency: perl(HTTP::Tiny) for package: perl-Pod-Perldoc-3.20-4.el7.noarch\n---> Package perl-podlators.noarch 0:2.5.1-3.el7 will be installed\n--> Running transaction check\n---> Package perl-Compress-Raw-Bzip2.x86_64 0:2.061-3.el7 will be installed\n---> Package perl-Compress-Raw-Zlib.x86_64 1:2.061-4.el7 will be installed\n---> Package perl-HTTP-Tiny.noarch 0:0.033-3.el7 will be installed\n---> Package perl-parent.noarch 1:0.225-244.el7 will be installed\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package                      Arch        Version               Repository\n                                                                           Size\n================================================================================\nInstalling:\n mariadb-server               x86_64      1:5.5.65-1.el7        base       11 M\nInstalling for dependencies:\n libaio                       x86_64      0.3.109-13.el7        base       24 k\n mariadb                      x86_64      1:5.5.65-1.el7        base      8.7 M\n perl                         x86_64      4:5.16.3-295.el7      base      8.0 M\n perl-Carp                    noarch      1.26-244.el7          base       19 k\n perl-Compress-Raw-Bzip2      x86_64      2.061-3.el7           base       32 k\n perl-Compress-Raw-Zlib       x86_64      1:2.061-4.el7         base       57 k\n perl-DBD-MySQL               x86_64      4.023-6.el7           base      140 k\n perl-DBI                     x86_64      1.627-4.el7           base      802 k\n perl-Data-Dumper             x86_64      2.145-3.el7           base       47 k\n perl-Encode                  x86_64      2.51-7.el7            base      1.5 M\n perl-Exporter                noarch      5.68-3.el7            base       28 k\n perl-File-Path               noarch      2.09-2.el7            base       26 k\n perl-File-Temp               noarch      0.23.01-3.el7         base       56 k\n perl-Filter                  x86_64      1.49-3.el7            base       76 k\n perl-Getopt-Long             noarch      2.40-3.el7            base       56 k\n perl-HTTP-Tiny               noarch      0.033-3.el7           base       38 k\n perl-IO-Compress             noarch      2.061-2.el7           base      260 k\n perl-Net-Daemon              noarch      0.48-5.el7            base       51 k\n perl-PathTools               x86_64      3.40-5.el7            base       82 k\n perl-PlRPC                   noarch      0.2020-14.el7         base       36 k\n perl-Pod-Escapes             noarch      1:1.04-295.el7        base       51 k\n perl-Pod-Perldoc             noarch      3.20-4.el7            base       87 k\n perl-Pod-Simple              noarch      1:3.28-4.el7          base      216 k\n perl-Pod-Usage               noarch      1.63-3.el7            base       27 k\n perl-Scalar-List-Utils       x86_64      1.27-248.el7          base       36 k\n perl-Socket                  x86_64      2.010-5.el7           base       49 k\n perl-Storable                x86_64      2.45-3.el7            base       77 k\n perl-Text-ParseWords         noarch      3.29-4.el7            base       14 k\n perl-Time-HiRes              x86_64      4:1.9725-3.el7        base       45 k\n perl-Time-Local              noarch      1.2300-2.el7          base       24 k\n perl-constant                noarch      1.27-2.el7            base       19 k\n perl-libs                    x86_64      4:5.16.3-295.el7      base      689 k\n perl-macros                  x86_64      4:5.16.3-295.el7      base       44 k\n perl-parent                  noarch      1:0.225-244.el7       base       12 k\n perl-podlators               noarch      2.5.1-3.el7           base      112 k\n perl-threads                 x86_64      1.87-4.el7            base       49 k\n perl-threads-shared          x86_64      1.43-6.el7            base       39 k\n\nTransaction Summary\n================================================================================\nInstall  1 Package (+37 Dependent packages)\n\nTotal download size: 33 M\nInstalled size: 147 M\nDownloading packages:\n--------------------------------------------------------------------------------\nTotal                                              691 kB/s |  33 MB  00:48     \nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Installing : 1:perl-parent-0.225-244.el7.noarch                          1/38 \n  Installing : perl-HTTP-Tiny-0.033-3.el7.noarch                           2/38 \n  Installing : perl-podlators-2.5.1-3.el7.noarch                           3/38 \n  Installing : perl-Pod-Perldoc-3.20-4.el7.noarch                          4/38 \n  Installing : 1:perl-Pod-Escapes-1.04-295.el7.noarch                      5/38 \n  Installing : perl-Text-ParseWords-3.29-4.el7.noarch                      6/38 \n  Installing : perl-Encode-2.51-7.el7.x86_64                               7/38 \n  Installing : perl-Pod-Usage-1.63-3.el7.noarch                            8/38 \n  Installing : 4:perl-libs-5.16.3-295.el7.x86_64                           9/38 \n  Installing : 4:perl-macros-5.16.3-295.el7.x86_64                        10/38 \n  Installing : perl-Storable-2.45-3.el7.x86_64                            11/38 \n  Installing : perl-Exporter-5.68-3.el7.noarch                            12/38 \n  Installing : perl-constant-1.27-2.el7.noarch                            13/38 \n  Installing : perl-Socket-2.010-5.el7.x86_64                             14/38 \n  Installing : perl-Time-Local-1.2300-2.el7.noarch                        15/38 \n  Installing : perl-Carp-1.26-244.el7.noarch                              16/38 \n  Installing : 4:perl-Time-HiRes-1.9725-3.el7.x86_64                      17/38 \n  Installing : perl-PathTools-3.40-5.el7.x86_64                           18/38 \n  Installing : perl-Scalar-List-Utils-1.27-248.el7.x86_64                 19/38 \n  Installing : perl-File-Temp-0.23.01-3.el7.noarch                        20/38 \n  Installing : perl-File-Path-2.09-2.el7.noarch                           21/38 \n  Installing : perl-threads-shared-1.43-6.el7.x86_64                      22/38 \n  Installing : perl-threads-1.87-4.el7.x86_64                             23/38 \n  Installing : perl-Filter-1.49-3.el7.x86_64                              24/38 \n  Installing : 1:perl-Pod-Simple-3.28-4.el7.noarch                        25/38 \n  Installing : perl-Getopt-Long-2.40-3.el7.noarch                         26/38 \n  Installing : 4:perl-5.16.3-295.el7.x86_64                               27/38 \n  Installing : perl-Data-Dumper-2.145-3.el7.x86_64                        28/38 \n  Installing : 1:mariadb-5.5.65-1.el7.x86_64                              29/38 \n  Installing : perl-Compress-Raw-Bzip2-2.061-3.el7.x86_64                 30/38 \n  Installing : perl-Net-Daemon-0.48-5.el7.noarch                          31/38 \n  Installing : 1:perl-Compress-Raw-Zlib-2.061-4.el7.x86_64                32/38 \n  Installing : perl-IO-Compress-2.061-2.el7.noarch                        33/38 \n  Installing : perl-PlRPC-0.2020-14.el7.noarch                            34/38 \n  Installing : perl-DBI-1.627-4.el7.x86_64                                35/38 \n  Installing : perl-DBD-MySQL-4.023-6.el7.x86_64                          36/38 \n  Installing : libaio-0.3.109-13.el7.x86_64                               37/38 \n  Installing : 1:mariadb-server-5.5.65-1.el7.x86_64                       38/38 \n  Verifying  : perl-HTTP-Tiny-0.033-3.el7.noarch                           1/38 \n  Verifying  : 1:mariadb-server-5.5.65-1.el7.x86_64                        2/38 \n  Verifying  : perl-threads-shared-1.43-6.el7.x86_64                       3/38 \n  Verifying  : perl-Storable-2.45-3.el7.x86_64                             4/38 \n  Verifying  : 1:perl-Pod-Escapes-1.04-295.el7.noarch                      5/38 \n  Verifying  : perl-DBD-MySQL-4.023-6.el7.x86_64                           6/38 \n  Verifying  : perl-Exporter-5.68-3.el7.noarch                             7/38 \n  Verifying  : perl-constant-1.27-2.el7.noarch                             8/38 \n  Verifying  : perl-PathTools-3.40-5.el7.x86_64                            9/38 \n  Verifying  : perl-Socket-2.010-5.el7.x86_64                             10/38 \n  Verifying  : 1:mariadb-5.5.65-1.el7.x86_64                              11/38 \n  Verifying  : 1:perl-parent-0.225-244.el7.noarch                         12/38 \n  Verifying  : perl-Compress-Raw-Bzip2-2.061-3.el7.x86_64                 13/38 \n  Verifying  : perl-Net-Daemon-0.48-5.el7.noarch                          14/38 \n  Verifying  : 4:perl-libs-5.16.3-295.el7.x86_64                          15/38 \n  Verifying  : perl-File-Temp-0.23.01-3.el7.noarch                        16/38 \n  Verifying  : 1:perl-Pod-Simple-3.28-4.el7.noarch                        17/38 \n  Verifying  : perl-Time-Local-1.2300-2.el7.noarch                        18/38 \n  Verifying  : perl-DBI-1.627-4.el7.x86_64                                19/38 \n  Verifying  : libaio-0.3.109-13.el7.x86_64                               20/38 \n  Verifying  : 4:perl-macros-5.16.3-295.el7.x86_64                        21/38 \n  Verifying  : 4:perl-5.16.3-295.el7.x86_64                               22/38 \n  Verifying  : perl-Carp-1.26-244.el7.noarch                              23/38 \n  Verifying  : perl-Data-Dumper-2.145-3.el7.x86_64                        24/38 \n  Verifying  : 4:perl-Time-HiRes-1.9725-3.el7.x86_64                      25/38 \n  Verifying  : perl-Scalar-List-Utils-1.27-248.el7.x86_64                 26/38 \n  Verifying  : 1:perl-Compress-Raw-Zlib-2.061-4.el7.x86_64                27/38 \n  Verifying  : perl-IO-Compress-2.061-2.el7.noarch                        28/38 \n  Verifying  : perl-Pod-Usage-1.63-3.el7.noarch                           29/38 \n  Verifying  : perl-PlRPC-0.2020-14.el7.noarch                            30/38 \n  Verifying  : perl-Encode-2.51-7.el7.x86_64                              31/38 \n  Verifying  : perl-Pod-Perldoc-3.20-4.el7.noarch                         32/38 \n  Verifying  : perl-podlators-2.5.1-3.el7.noarch                          33/38 \n  Verifying  : perl-File-Path-2.09-2.el7.noarch                           34/38 \n  Verifying  : perl-threads-1.87-4.el7.x86_64                             35/38 \n  Verifying  : perl-Filter-1.49-3.el7.x86_64                              36/38 \n  Verifying  : perl-Getopt-Long-2.40-3.el7.noarch                         37/38 \n  Verifying  : perl-Text-ParseWords-3.29-4.el7.noarch                     38/38 \n\nInstalled:\n  mariadb-server.x86_64 1:5.5.65-1.el7                                          \n\nDependency Installed:\n  libaio.x86_64 0:0.3.109-13.el7                                                \n  mariadb.x86_64 1:5.5.65-1.el7                                                 \n  perl.x86_64 4:5.16.3-295.el7                                                  \n  perl-Carp.noarch 0:1.26-244.el7                                               \n  perl-Compress-Raw-Bzip2.x86_64 0:2.061-3.el7                                  \n  perl-Compress-Raw-Zlib.x86_64 1:2.061-4.el7                                   \n  perl-DBD-MySQL.x86_64 0:4.023-6.el7                                           \n  perl-DBI.x86_64 0:1.627-4.el7                                                 \n  perl-Data-Dumper.x86_64 0:2.145-3.el7                                         \n  perl-Encode.x86_64 0:2.51-7.el7                                               \n  perl-Exporter.noarch 0:5.68-3.el7                                             \n  perl-File-Path.noarch 0:2.09-2.el7                                            \n  perl-File-Temp.noarch 0:0.23.01-3.el7                                         \n  perl-Filter.x86_64 0:1.49-3.el7                                               \n  perl-Getopt-Long.noarch 0:2.40-3.el7                                          \n  perl-HTTP-Tiny.noarch 0:0.033-3.el7                                           \n  perl-IO-Compress.noarch 0:2.061-2.el7                                         \n  perl-Net-Daemon.noarch 0:0.48-5.el7                                           \n  perl-PathTools.x86_64 0:3.40-5.el7                                            \n  perl-PlRPC.noarch 0:0.2020-14.el7                                             \n  perl-Pod-Escapes.noarch 1:1.04-295.el7                                        \n  perl-Pod-Perldoc.noarch 0:3.20-4.el7                                          \n  perl-Pod-Simple.noarch 1:3.28-4.el7                                           \n  perl-Pod-Usage.noarch 0:1.63-3.el7                                            \n  perl-Scalar-List-Utils.x86_64 0:1.27-248.el7                                  \n  perl-Socket.x86_64 0:2.010-5.el7                                              \n  perl-Storable.x86_64 0:2.45-3.el7                                             \n  perl-Text-ParseWords.noarch 0:3.29-4.el7                                      \n  perl-Time-HiRes.x86_64 4:1.9725-3.el7                                         \n  perl-Time-Local.noarch 0:1.2300-2.el7                                         \n  perl-constant.noarch 0:1.27-2.el7                                             \n  perl-libs.x86_64 4:5.16.3-295.el7                                             \n  perl-macros.x86_64 4:5.16.3-295.el7                                           \n  perl-parent.noarch 1:0.225-244.el7                                            \n  perl-podlators.noarch 0:2.5.1-3.el7                                           \n  perl-threads.x86_64 0:1.87-4.el7                                              \n  perl-threads-shared.x86_64 0:1.43-6.el7                                       \n\nComplete!\n"
    ]
}

❯ ansible db -b -m service -a "name=mariadb state=started enabled=yes"
192.168.100.12 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "enabled": true,
    "name": "mariadb",
    "state": "started",
    "status": {
        "ActiveEnterTimestampMonotonic": "0",
        "ActiveExitTimestampMonotonic": "0",
        "ActiveState": "inactive",
        "After": "syslog.target basic.target network.target systemd-journald.socket tmp.mount system.slice -.mount",
        "AllowIsolate": "no",
        "AmbientCapabilities": "0",
        "AssertResult": "no",
        "AssertTimestampMonotonic": "0",
        "Before": "shutdown.target",
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
        "Conflicts": "shutdown.target",
        "ControlPID": "0",
        "DefaultDependencies": "yes",
        "Delegate": "no",
        "Description": "MariaDB database server",
        "DevicePolicy": "auto",
        "ExecMainCode": "0",
        "ExecMainExitTimestampMonotonic": "0",
        "ExecMainPID": "0",
        "ExecMainStartTimestampMonotonic": "0",
        "ExecMainStatus": "0",
        "ExecStart": "{ path=/usr/bin/mysqld_safe ; argv[]=/usr/bin/mysqld_safe --basedir=/usr ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStartPost": "{ path=/usr/libexec/mariadb-wait-ready ; argv[]=/usr/libexec/mariadb-wait-ready $MAINPID ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStartPre": "{ path=/usr/libexec/mariadb-prepare-db-dir ; argv[]=/usr/libexec/mariadb-prepare-db-dir %n ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "FailureAction": "none",
        "FileDescriptorStoreMax": "0",
        "FragmentPath": "/usr/lib/systemd/system/mariadb.service",
        "Group": "mysql",
        "GuessMainPID": "yes",
        "IOScheduling": "0",
        "Id": "mariadb.service",
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
        "Names": "mariadb.service",
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
        "Requires": "-.mount basic.target system.slice",
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
        "TimeoutStartUSec": "5min",
        "TimeoutStopUSec": "5min",
        "TimerSlackNSec": "50000",
        "Transient": "no",
        "Type": "simple",
        "UMask": "0022",
        "UnitFilePreset": "disabled",
        "UnitFileState": "disabled",
        "User": "mysql",
        "WatchdogTimestampMonotonic": "0",
        "WatchdogUSec": "0"
    }
}

❯ ansible db -b -a "iptables -F"
192.168.100.12 | CHANGED | rc=0 >>

❯ ansible db -b -a "iptables -A INPUT -s 192.168.100.0/24 -p tcp -m tcp --dport 3306 -j ACCEPT"
192.168.100.12 | CHANGED | rc=0 >>

❯ ansible db -b -m yum -a "name=MySQL-python state=latest"
192.168.100.12 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "changes": {
        "installed": [
            "MySQL-python"
        ],
        "updated": []
    },
    "msg": "",
    "rc": 0,
    "results": [
        "Loaded plugins: fastestmirror\nLoading mirror speeds from cached hostfile\n * base: mirror.netglobalis.net\n * extras: mirror.netglobalis.net\n * updates: mirror.netglobalis.net\nResolving Dependencies\n--> Running transaction check\n---> Package MySQL-python.x86_64 0:1.2.5-1.el7 will be installed\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package               Arch            Version              Repository     Size\n================================================================================\nInstalling:\n MySQL-python          x86_64          1.2.5-1.el7          base           90 k\n\nTransaction Summary\n================================================================================\nInstall  1 Package\n\nTotal download size: 90 k\nInstalled size: 284 k\nDownloading packages:\nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Installing : MySQL-python-1.2.5-1.el7.x86_64                              1/1 \n  Verifying  : MySQL-python-1.2.5-1.el7.x86_64                              1/1 \n\nInstalled:\n  MySQL-python.x86_64 0:1.2.5-1.el7                                             \n\nComplete!\n"
    ]
}

❯ ansible db -b -m mysql_user -a "name=django host=% password=12345 priv=*.*:ALL state=present"
[WARNING]: Module did not set no_log for update_password
192.168.100.12 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "msg": "User added",
    "user": "django"
}
```

At this point, you can deploy a Django app to the `app` servers and point it to the DB server using the username `django` and password `12345`.

## Running a command on a single server

- Suppose you want to restart `ntpd` only on `app2`

```console
❯ ansible app -b -a "systemctl restart ntpd" --limit "192.168.100.11"
192.168.100.11 | CHANGED | rc=0 >>

```

- RegEx and wildcards can be used too
  - The following commands would do the exact same thing as the previous one

```console
❯ ansible app -b -a "systemctl restart ntpd" --limit "*.11"
192.168.100.11 | CHANGED | rc=0 >>

❯ ansible app -b -a "systemctl restart ntpd" --limit ~".*\.11"
192.168.100.11 | CHANGED | rc=0 >>

```
