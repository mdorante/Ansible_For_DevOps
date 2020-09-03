# Ad-Hoc Commands Used

## Basic Commands

- Run the `hostname` command on all `multi` servers in parallel
  - **Note**: `multi` is the group name used in `/etc/ansible/hosts`

```console
❯ ansible multi -a "hostname"
192.168.100.11 | CHANGED | rc=0 >>
app2.test
192.168.100.12 | CHANGED | rc=0 >>
db1.test
192.168.100.10 | CHANGED | rc=0 >>
app1.test
```

- Run the `hostname` command on all `multi` servers using only 1 fork (sequentially)
  - This one lasts longer since Ansible waits for each execution to finish before moving on to the next server

```console
❯ ansible multi -a "hostname" -f 1
192.168.100.10 | CHANGED | rc=0 >>
app1.test
192.168.100.11 | CHANGED | rc=0 >>
app2.test
192.168.100.12 | CHANGED | rc=0 >>
db1.test
```

- Check disk space on all `multi` servers

```console
❯ ansible multi -a "df -h"
192.168.100.11 | CHANGED | rc=0 >>
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        111M     0  111M   0% /dev
tmpfs           118M     0  118M   0% /dev/shm
tmpfs           118M  4.5M  114M   4% /run
tmpfs           118M     0  118M   0% /sys/fs/cgroup
/dev/sda1        40G  3.0G   38G   8% /
tmpfs            24M     0   24M   0% /run/user/1000
192.168.100.10 | CHANGED | rc=0 >>
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        111M     0  111M   0% /dev
tmpfs           118M     0  118M   0% /dev/shm
tmpfs           118M  4.5M  114M   4% /run
tmpfs           118M     0  118M   0% /sys/fs/cgroup
/dev/sda1        40G  3.0G   38G   8% /
tmpfs            24M     0   24M   0% /run/user/1000
192.168.100.12 | CHANGED | rc=0 >>
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        111M     0  111M   0% /dev
tmpfs           118M     0  118M   0% /dev/shm
tmpfs           118M  4.5M  114M   4% /run
tmpfs           118M     0  118M   0% /sys/fs/cgroup
/dev/sda1        40G  3.0G   38G   8% /
tmpfs            24M     0   24M   0% /run/user/1000
```

- Check memory on all `multi` servers

```console
192.168.100.11 | CHANGED | rc=0 >>
              total        used        free      shared  buff/cache   available
Mem:            235          86          56           4          91         135
Swap:          2047           0        2047
192.168.100.12 | CHANGED | rc=0 >>
              total        used        free      shared  buff/cache   available
Mem:            235          86          56           4          91         135
Swap:          2047           0        2047
192.168.100.10 | CHANGED | rc=0 >>
              total        used        free      shared  buff/cache   available
Mem:            235          86          56           4          91         135
Swap:          2047           0        2047
```

- Check date and time on `multi` severs to check if they`re in sync

```console
192.168.100.11 | CHANGED | rc=0 >>
Wed Sep  2 20:50:44 UTC 2020
192.168.100.10 | CHANGED | rc=0 >>
Wed Sep  2 20:50:44 UTC 2020
192.168.100.12 | CHANGED | rc=0 >>
Wed Sep  2 20:50:44 UTC 2020
```

- Get all environment details (Ansible Facts) from `db` server

```console
192.168.100.12 | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "192.168.100.12",
            "10.0.2.15"
        ],
        "ansible_all_ipv6_addresses": [
            "fe80::a00:27ff:fe48:2f5c",
            "fe80::5054:ff:fe4d:77d3"
        ],
        "ansible_apparmor": {
            "status": "disabled"
        },
        "ansible_architecture": "x86_64",
        "ansible_bios_date": "12/01/2006",
        "ansible_bios_version": "VirtualBox",
        "ansible_cmdline": {
            "BOOT_IMAGE": "/boot/vmlinuz-3.10.0-1127.el7.x86_64",
            "LANG": "en_US.UTF-8",
            "biosdevname": "0",
            "console": "ttyS0,115200n8",
            "crashkernel": "auto",
            "elevator": "noop",
            "net.ifnames": "0",
            "no_timer_check": true,
            "ro": true,
            "root": "UUID=1c419d6c-5064-4a2b-953c-05b2c67edb15"
        },
        "ansible_date_time": {
            "date": "2020-09-02",
            "day": "02",
            "epoch": "1599080056",
            "hour": "20",
            "iso8601": "2020-09-02T20:54:16Z",
            "iso8601_basic": "20200902T205416722729",
            "iso8601_basic_short": "20200902T205416",
            "iso8601_micro": "2020-09-02T20:54:16.722729Z",
            "minute": "54",
            "month": "09",
            "second": "16",
            "time": "20:54:16",
            "tz": "UTC",
            "tz_offset": "+0000",
            "weekday": "Wednesday",
            "weekday_number": "3",
            "weeknumber": "35",
            "year": "2020"
        },
        "ansible_default_ipv4": {
            "address": "10.0.2.15",
            "alias": "eth0",
            "broadcast": "10.0.2.255",
            "gateway": "10.0.2.2",
            "interface": "eth0",
            "macaddress": "52:54:00:4d:77:d3",
            "mtu": 1500,
            "netmask": "255.255.255.0",
            "network": "10.0.2.0",
            "type": "ether"
        },
        "ansible_default_ipv6": {},
        "ansible_device_links": {
            "ids": {
                "sda": [
                    "ata-VBOX_HARDDISK_VB51dcdd0b-df920dfc"
                ],
                "sda1": [
                    "ata-VBOX_HARDDISK_VB51dcdd0b-df920dfc-part1"
                ]
            },
            "labels": {},
            "masters": {},
            "uuids": {
                "sda1": [
                    "1c419d6c-5064-4a2b-953c-05b2c67edb15"
                ]
            }
        },
        "ansible_devices": {
            "sda": {
                "holders": [],
                "host": "IDE interface: Intel Corporation 82371AB/EB/MB PIIX4 IDE (rev 01)",
                "links": {
                    "ids": [
                        "ata-VBOX_HARDDISK_VB51dcdd0b-df920dfc"
                    ],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": "VBOX HARDDISK",
                "partitions": {
                    "sda1": {
                        "holders": [],
                        "links": {
                            "ids": [
                                "ata-VBOX_HARDDISK_VB51dcdd0b-df920dfc-part1"
                            ],
                            "labels": [],
                            "masters": [],
                            "uuids": [
                                "1c419d6c-5064-4a2b-953c-05b2c67edb15"
                            ]
                        },
                        "sectors": "83884032",
                        "sectorsize": 512,
                        "size": "40.00 GB",
                        "start": "2048",
                        "uuid": "1c419d6c-5064-4a2b-953c-05b2c67edb15"
                    }
                },
                "removable": "0",
                "rotational": "1",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "noop",
                "sectors": "83886080",
                "sectorsize": "512",
                "size": "40.00 GB",
                "support_discard": "0",
                "vendor": "ATA",
                "virtual": 1
            }
        },
        "ansible_distribution": "CentOS",
        "ansible_distribution_file_parsed": true,
        "ansible_distribution_file_path": "/etc/redhat-release",
        "ansible_distribution_file_variety": "RedHat",
        "ansible_distribution_major_version": "7",
        "ansible_distribution_release": "Core",
        "ansible_distribution_version": "7.8",
        "ansible_dns": {
            "nameservers": [
                "10.0.2.3"
            ],
            "search": [
                "test"
            ]
        },
        "ansible_domain": "test",
        "ansible_effective_group_id": 1000,
        "ansible_effective_user_id": 1000,
        "ansible_env": {
            "HOME": "/home/vagrant",
            "LANG": "C",
            "LC_ALL": "C",
            "LC_CTYPE": "UTF-8",
            "LC_MESSAGES": "C",
            "LESSOPEN": "||/usr/bin/lesspipe.sh %s",
            "LOGNAME": "vagrant",
            "LS_COLORS": "rs=0:di=38;5;27:ln=38;5;51:mh=44;38;5;15:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=05;48;5;232;38;5;15:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;21:st=48;5;21;38;5;15:ex=38;5;34:*.tar=38;5;9:*.tgz=38;5;9:*.arc=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lha=38;5;9:*.lz4=38;5;9:*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.txz=38;5;9:*.tzo=38;5;9:*.t7z=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.dz=38;5;9:*.gz=38;5;9:*.lrz=38;5;9:*.lz=38;5;9:*.lzo=38;5;9:*.xz=38;5;9:*.bz2=38;5;9:*.bz=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.tz=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.war=38;5;9:*.ear=38;5;9:*.sar=38;5;9:*.rar=38;5;9:*.alz=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.7z=38;5;9:*.rz=38;5;9:*.cab=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.svg=38;5;13:*.svgz=38;5;13:*.mng=38;5;13:*.pcx=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.m2v=38;5;13:*.mkv=38;5;13:*.webm=38;5;13:*.ogm=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:*.mp4v=38;5;13:*.vob=38;5;13:*.qt=38;5;13:*.nuv=38;5;13:*.wmv=38;5;13:*.asf=38;5;13:*.rm=38;5;13:*.rmvb=38;5;13:*.flc=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.flv=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.yuv=38;5;13:*.cgm=38;5;13:*.emf=38;5;13:*.axv=38;5;13:*.anx=38;5;13:*.ogv=38;5;13:*.ogx=38;5;13:*.aac=38;5;45:*.au=38;5;45:*.flac=38;5;45:*.mid=38;5;45:*.midi=38;5;45:*.mka=38;5;45:*.mp3=38;5;45:*.mpc=38;5;45:*.ogg=38;5;45:*.ra=38;5;45:*.wav=38;5;45:*.axa=38;5;45:*.oga=38;5;45:*.spx=38;5;45:*.xspf=38;5;45:",
            "MAIL": "/var/mail/vagrant",
            "PATH": "/usr/local/bin:/usr/bin",
            "PWD": "/home/vagrant",
            "SELINUX_LEVEL_REQUESTED": "",
            "SELINUX_ROLE_REQUESTED": "",
            "SELINUX_USE_CURRENT_RANGE": "",
            "SHELL": "/bin/bash",
            "SHLVL": "2",
            "SSH_CLIENT": "192.168.100.1 53641 22",
            "SSH_CONNECTION": "192.168.100.1 53641 192.168.100.12 22",
            "SSH_TTY": "/dev/pts/0",
            "TERM": "xterm-256color",
            "USER": "vagrant",
            "XDG_RUNTIME_DIR": "/run/user/1000",
            "XDG_SESSION_ID": "8",
            "_": "/usr/bin/python"
        },
        "ansible_eth0": {
            "active": true,
            "device": "eth0",
            "features": {
                "busy_poll": "off [fixed]",
                "fcoe_mtu": "off [fixed]",
                "generic_receive_offload": "on",
                "generic_segmentation_offload": "on",
                "highdma": "off [fixed]",
                "hw_tc_offload": "off [fixed]",
                "l2_fwd_offload": "off [fixed]",
                "large_receive_offload": "off [fixed]",
                "loopback": "off [fixed]",
                "netns_local": "off [fixed]",
                "ntuple_filters": "off [fixed]",
                "receive_hashing": "off [fixed]",
                "rx_all": "off",
                "rx_checksumming": "off",
                "rx_fcs": "off",
                "rx_gro_hw": "off [fixed]",
                "rx_udp_tunnel_port_offload": "off [fixed]",
                "rx_vlan_filter": "on [fixed]",
                "rx_vlan_offload": "on",
                "rx_vlan_stag_filter": "off [fixed]",
                "rx_vlan_stag_hw_parse": "off [fixed]",
                "scatter_gather": "on",
                "tcp_segmentation_offload": "on",
                "tx_checksum_fcoe_crc": "off [fixed]",
                "tx_checksum_ip_generic": "on",
                "tx_checksum_ipv4": "off [fixed]",
                "tx_checksum_ipv6": "off [fixed]",
                "tx_checksum_sctp": "off [fixed]",
                "tx_checksumming": "on",
                "tx_fcoe_segmentation": "off [fixed]",
                "tx_gre_csum_segmentation": "off [fixed]",
                "tx_gre_segmentation": "off [fixed]",
                "tx_gso_partial": "off [fixed]",
                "tx_gso_robust": "off [fixed]",
                "tx_ipip_segmentation": "off [fixed]",
                "tx_lockless": "off [fixed]",
                "tx_nocache_copy": "off",
                "tx_scatter_gather": "on",
                "tx_scatter_gather_fraglist": "off [fixed]",
                "tx_sctp_segmentation": "off [fixed]",
                "tx_sit_segmentation": "off [fixed]",
                "tx_tcp6_segmentation": "off [fixed]",
                "tx_tcp_ecn_segmentation": "off [fixed]",
                "tx_tcp_mangleid_segmentation": "off",
                "tx_tcp_segmentation": "on",
                "tx_udp_tnl_csum_segmentation": "off [fixed]",
                "tx_udp_tnl_segmentation": "off [fixed]",
                "tx_vlan_offload": "on [fixed]",
                "tx_vlan_stag_hw_insert": "off [fixed]",
                "udp_fragmentation_offload": "off [fixed]",
                "vlan_challenged": "off [fixed]"
            },
            "hw_timestamp_filters": [],
            "ipv4": {
                "address": "10.0.2.15",
                "broadcast": "10.0.2.255",
                "netmask": "255.255.255.0",
                "network": "10.0.2.0"
            },
            "ipv6": [
                {
                    "address": "fe80::5054:ff:fe4d:77d3",
                    "prefix": "64",
                    "scope": "link"
                }
            ],
            "macaddress": "52:54:00:4d:77:d3",
            "module": "e1000",
            "mtu": 1500,
            "pciid": "0000:00:03.0",
            "promisc": false,
            "speed": 1000,
            "timestamping": [
                "tx_software",
                "rx_software",
                "software"
            ],
            "type": "ether"
        },
        "ansible_eth1": {
            "active": true,
            "device": "eth1",
            "features": {
                "busy_poll": "off [fixed]",
                "fcoe_mtu": "off [fixed]",
                "generic_receive_offload": "on",
                "generic_segmentation_offload": "on",
                "highdma": "off [fixed]",
                "hw_tc_offload": "off [fixed]",
                "l2_fwd_offload": "off [fixed]",
                "large_receive_offload": "off [fixed]",
                "loopback": "off [fixed]",
                "netns_local": "off [fixed]",
                "ntuple_filters": "off [fixed]",
                "receive_hashing": "off [fixed]",
                "rx_all": "off",
                "rx_checksumming": "off",
                "rx_fcs": "off",
                "rx_gro_hw": "off [fixed]",
                "rx_udp_tunnel_port_offload": "off [fixed]",
                "rx_vlan_filter": "on [fixed]",
                "rx_vlan_offload": "on",
                "rx_vlan_stag_filter": "off [fixed]",
                "rx_vlan_stag_hw_parse": "off [fixed]",
                "scatter_gather": "on",
                "tcp_segmentation_offload": "on",
                "tx_checksum_fcoe_crc": "off [fixed]",
                "tx_checksum_ip_generic": "on",
                "tx_checksum_ipv4": "off [fixed]",
                "tx_checksum_ipv6": "off [fixed]",
                "tx_checksum_sctp": "off [fixed]",
                "tx_checksumming": "on",
                "tx_fcoe_segmentation": "off [fixed]",
                "tx_gre_csum_segmentation": "off [fixed]",
                "tx_gre_segmentation": "off [fixed]",
                "tx_gso_partial": "off [fixed]",
                "tx_gso_robust": "off [fixed]",
                "tx_ipip_segmentation": "off [fixed]",
                "tx_lockless": "off [fixed]",
                "tx_nocache_copy": "off",
                "tx_scatter_gather": "on",
                "tx_scatter_gather_fraglist": "off [fixed]",
                "tx_sctp_segmentation": "off [fixed]",
                "tx_sit_segmentation": "off [fixed]",
                "tx_tcp6_segmentation": "off [fixed]",
                "tx_tcp_ecn_segmentation": "off [fixed]",
                "tx_tcp_mangleid_segmentation": "off",
                "tx_tcp_segmentation": "on",
                "tx_udp_tnl_csum_segmentation": "off [fixed]",
                "tx_udp_tnl_segmentation": "off [fixed]",
                "tx_vlan_offload": "on [fixed]",
                "tx_vlan_stag_hw_insert": "off [fixed]",
                "udp_fragmentation_offload": "off [fixed]",
                "vlan_challenged": "off [fixed]"
            },
            "hw_timestamp_filters": [],
            "ipv4": {
                "address": "192.168.100.12",
                "broadcast": "192.168.100.255",
                "netmask": "255.255.255.0",
                "network": "192.168.100.0"
            },
            "ipv6": [
                {
                    "address": "fe80::a00:27ff:fe48:2f5c",
                    "prefix": "64",
                    "scope": "link"
                }
            ],
            "macaddress": "08:00:27:48:2f:5c",
            "module": "e1000",
            "mtu": 1500,
            "pciid": "0000:00:08.0",
            "promisc": false,
            "speed": 1000,
            "timestamping": [
                "tx_software",
                "rx_software",
                "software"
            ],
            "type": "ether"
        },
        "ansible_fibre_channel_wwn": [],
        "ansible_fips": false,
        "ansible_form_factor": "Other",
        "ansible_fqdn": "db1.test",
        "ansible_hostname": "db1",
        "ansible_hostnqn": "",
        "ansible_interfaces": [
            "lo",
            "eth1",
            "eth0"
        ],
        "ansible_is_chroot": true,
        "ansible_iscsi_iqn": "",
        "ansible_kernel": "3.10.0-1127.el7.x86_64",
        "ansible_kernel_version": "#1 SMP Tue Mar 31 23:36:51 UTC 2020",
        "ansible_lo": {
            "active": true,
            "device": "lo",
            "features": {
                "busy_poll": "off [fixed]",
                "fcoe_mtu": "off [fixed]",
                "generic_receive_offload": "on",
                "generic_segmentation_offload": "on",
                "highdma": "on [fixed]",
                "hw_tc_offload": "off [fixed]",
                "l2_fwd_offload": "off [fixed]",
                "large_receive_offload": "off [fixed]",
                "loopback": "on [fixed]",
                "netns_local": "on [fixed]",
                "ntuple_filters": "off [fixed]",
                "receive_hashing": "off [fixed]",
                "rx_all": "off [fixed]",
                "rx_checksumming": "on [fixed]",
                "rx_fcs": "off [fixed]",
                "rx_gro_hw": "off [fixed]",
                "rx_udp_tunnel_port_offload": "off [fixed]",
                "rx_vlan_filter": "off [fixed]",
                "rx_vlan_offload": "off [fixed]",
                "rx_vlan_stag_filter": "off [fixed]",
                "rx_vlan_stag_hw_parse": "off [fixed]",
                "scatter_gather": "on",
                "tcp_segmentation_offload": "on",
                "tx_checksum_fcoe_crc": "off [fixed]",
                "tx_checksum_ip_generic": "on [fixed]",
                "tx_checksum_ipv4": "off [fixed]",
                "tx_checksum_ipv6": "off [fixed]",
                "tx_checksum_sctp": "on [fixed]",
                "tx_checksumming": "on",
                "tx_fcoe_segmentation": "off [fixed]",
                "tx_gre_csum_segmentation": "off [fixed]",
                "tx_gre_segmentation": "off [fixed]",
                "tx_gso_partial": "off [fixed]",
                "tx_gso_robust": "off [fixed]",
                "tx_ipip_segmentation": "off [fixed]",
                "tx_lockless": "on [fixed]",
                "tx_nocache_copy": "off [fixed]",
                "tx_scatter_gather": "on [fixed]",
                "tx_scatter_gather_fraglist": "on [fixed]",
                "tx_sctp_segmentation": "on",
                "tx_sit_segmentation": "off [fixed]",
                "tx_tcp6_segmentation": "on",
                "tx_tcp_ecn_segmentation": "on",
                "tx_tcp_mangleid_segmentation": "on",
                "tx_tcp_segmentation": "on",
                "tx_udp_tnl_csum_segmentation": "off [fixed]",
                "tx_udp_tnl_segmentation": "off [fixed]",
                "tx_vlan_offload": "off [fixed]",
                "tx_vlan_stag_hw_insert": "off [fixed]",
                "udp_fragmentation_offload": "on",
                "vlan_challenged": "on [fixed]"
            },
            "hw_timestamp_filters": [],
            "ipv4": {
                "address": "127.0.0.1",
                "broadcast": "",
                "netmask": "255.0.0.0",
                "network": "127.0.0.0"
            },
            "ipv6": [
                {
                    "address": "::1",
                    "prefix": "128",
                    "scope": "host"
                }
            ],
            "mtu": 65536,
            "promisc": false,
            "timestamping": [
                "rx_software",
                "software"
            ],
            "type": "loopback"
        },
        "ansible_local": {},
        "ansible_lsb": {},
        "ansible_machine": "x86_64",
        "ansible_machine_id": "f7ac2cc1623ac641b601deba108b8c9a",
        "ansible_memfree_mb": 49,
        "ansible_memory_mb": {
            "nocache": {
                "free": 131,
                "used": 104
            },
            "real": {
                "free": 49,
                "total": 235,
                "used": 186
            },
            "swap": {
                "cached": 0,
                "free": 2047,
                "total": 2047,
                "used": 0
            }
        },
        "ansible_memtotal_mb": 235,
        "ansible_mounts": [
            {
                "block_available": 9701985,
                "block_size": 4096,
                "block_total": 10480385,
                "block_used": 778400,
                "device": "/dev/sda1",
                "fstype": "xfs",
                "inode_available": 20943309,
                "inode_total": 20971008,
                "inode_used": 27699,
                "mount": "/",
                "options": "rw,seclabel,relatime,attr2,inode64,noquota",
                "size_available": 39739330560,
                "size_total": 42927656960,
                "uuid": "1c419d6c-5064-4a2b-953c-05b2c67edb15"
            }
        ],
        "ansible_nodename": "db1.test",
        "ansible_os_family": "RedHat",
        "ansible_pkg_mgr": "yum",
        "ansible_proc_cmdline": {
            "BOOT_IMAGE": "/boot/vmlinuz-3.10.0-1127.el7.x86_64",
            "LANG": "en_US.UTF-8",
            "biosdevname": "0",
            "console": [
                "tty0",
                "ttyS0,115200n8"
            ],
            "crashkernel": "auto",
            "elevator": "noop",
            "net.ifnames": "0",
            "no_timer_check": true,
            "ro": true,
            "root": "UUID=1c419d6c-5064-4a2b-953c-05b2c67edb15"
        },
        "ansible_processor": [
            "0",
            "GenuineIntel",
            "Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz"
        ],
        "ansible_processor_cores": 1,
        "ansible_processor_count": 1,
        "ansible_processor_threads_per_core": 1,
        "ansible_processor_vcpus": 1,
        "ansible_product_name": "VirtualBox",
        "ansible_product_serial": "NA",
        "ansible_product_uuid": "NA",
        "ansible_product_version": "1.2",
        "ansible_python": {
            "executable": "/usr/bin/python",
            "has_sslcontext": true,
            "type": "CPython",
            "version": {
                "major": 2,
                "micro": 5,
                "minor": 7,
                "releaselevel": "final",
                "serial": 0
            },
            "version_info": [
                2,
                7,
                5,
                "final",
                0
            ]
        },
        "ansible_python_version": "2.7.5",
        "ansible_real_group_id": 1000,
        "ansible_real_user_id": 1000,
        "ansible_selinux": {
            "config_mode": "enforcing",
            "mode": "enforcing",
            "policyvers": 31,
            "status": "enabled",
            "type": "targeted"
        },
        "ansible_selinux_python_present": true,
        "ansible_service_mgr": "systemd",
        "ansible_ssh_host_key_ecdsa_public": "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBAgFtYABd9WaX9H12emoEECxL6zf1AOhTKnTzj8bfRa2JU3ECAcqyFgMDPwW1Irk0JB1K+yiqVXpSOuzj5FptkE=",
        "ansible_ssh_host_key_ed25519_public": "AAAAC3NzaC1lZDI1NTE5AAAAIBRVmpxvR0eyy27mfrGA7smOhtW3XWhgaa47k7CgPbme",
        "ansible_ssh_host_key_rsa_public": "AAAAB3NzaC1yc2EAAAADAQABAAABAQCnB4qPBK3NNg3ot5F/SBYTZ66eXt2qyMEeeH7SQWRFHoyl3fK01RegWO1FQLGe8G5JzC2a+MJx7ZyiBXtGYKcNDj154/ma2ugB6ig6W5X1RxBMwL4a1WBKydfOoe9DqJFGz59qcxP/VKwKmlrkb34u0kAWWXEl371YHtZPbMcp9IArN+s/n+WOJqOyDSVT8k8KSKRT3+3tkbIZeZ9PlduDyGvmPhIxyZvFKMpoQDKfX2CoHVukYClG5VAKVUKbAB+tE53J2ATeO+vmFJPXWvP4GxRox7TBJJnAtrY6lpbrNTAwi4IdHpfMHWJqVYe9NMYFqGk2etLpBVDoAlDV6kY/",
        "ansible_swapfree_mb": 2047,
        "ansible_swaptotal_mb": 2047,
        "ansible_system": "Linux",
        "ansible_system_capabilities": [
            ""
        ],
        "ansible_system_capabilities_enforced": "True",
        "ansible_system_vendor": "innotek GmbH",
        "ansible_uptime_seconds": 854,
        "ansible_user_dir": "/home/vagrant",
        "ansible_user_gecos": "vagrant",
        "ansible_user_gid": 1000,
        "ansible_user_id": "vagrant",
        "ansible_user_shell": "/bin/bash",
        "ansible_user_uid": 1000,
        "ansible_userspace_architecture": "x86_64",
        "ansible_userspace_bits": "64",
        "ansible_virtualization_role": "guest",
        "ansible_virtualization_type": "virtualbox",
        "discovered_interpreter_python": "/usr/bin/python",
        "gather_subset": [
            "all"
        ],
        "module_setup": true
    },
    "changed": false
}
```

## Using Ansible Modules

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

## Using Host Groups

### Configure the Application Servers

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

### Configure the Database Server

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

### Running a command on a single server

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

