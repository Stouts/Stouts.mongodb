Stouts.mongodb
==============

[![Build Status](http://img.shields.io/travis/Stouts/Stouts.mongodb.svg?style=flat-square)](https://travis-ci.org/Stouts/Stouts.mongodb)
[![Galaxy](http://img.shields.io/badge/galaxy-Stouts.mongodb-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/982)

Ansible role which manage [MongoDB](http://www.mongodb.org/)

* Install and configure the MongoDB;
* Provide hanlers for restart and reload;
* Setup MMS authomation agent;

#### Variables

```yaml

mongodb_enabled: yes
mongodb_install: yes

mongodb_additional_packages:
- python-selinux
- python-pymongo

mongodb_user: mongodb

mongodb_version: "3.2.4"                         # Fully specified target installation version

# Service setup options
mongodb_version_config:                          # Custom configuration for major/minor version variants
  v2.4:
    daemon: mongodb
    config_file: mongodb.conf
  v2.6:
    daemon: mongod
    config_file: mongod.conf
  v3.0:
    daemon: mongod
    config_file: mongod.conf
  v3.2:
    daemon: mongod
    config_file: mongod.conf

# Config options
mongodb_conf_auth: no                             # Run with security
mongodb_conf_bind_ip: 127.0.0.1                   # Comma separated list of ip addresses to listen on
mongodb_conf_cpu: yes                             # Periodically show cpu and iowait utilization
mongodb_conf_dbpath: /data/db                     # Directory for datafiles
mongodb_conf_fork: no                             # Fork server process
mongodb_conf_httpinterface: no                    # Enable http interface
mongodb_conf_ipv6: no                             # Enable IPv6 support (disabled by default)
mongodb_conf_journal: no                          # Enable journaling
mongodb_conf_logappend: yes                       # Append to logpath instead of over-writing
mongodb_conf_logpath: /var/log/mongodb/{{ mongodb_daemon_name }}.log # Log file to send write to instead of stdout
mongodb_conf_maxConns: 20000                      # Max number of simultaneous connections
mongodb_conf_noprealloc: no                       # Disable data file preallocation
mongodb_conf_noscripting: no                      # Disable scripting engine
mongodb_conf_notablescan: no                      # Do not allow table scans
mongodb_conf_port: 27017                          # Specify port number
mongodb_conf_quota: no                            # Limits each database to a certain number of files
mongodb_conf_quotaFiles: 8                        # Number of quota files
mongodb_conf_syslog: no                           # Log to system's syslog facility instead of file (ignored if logpath set)
mongodb_conf_smallfiles: no                       # Sets MongoDB to use a smaller default file size

# Replica set options:
mongodb_conf_replSet:                             # Enable replication <setname>[/<optionalseedhostlist>]
mongodb_conf_replIndexPrefetch: all               # specify index prefetching behavior (if secondary) [none|_id_only|all]

mongodb_shell: {}                                 # Define mongo shell commands to run
                                                  # Syntax: mongodb_shell:
                                                  #          dbname:
                                                  #           - db.setProfilingLevel(1, 50)


# MMS Agent
mongodb_mms_agent_pkg: https://mms.mongodb.com/download/agent/automation/mongodb-mms-automation-agent-manager_latest_amd64.deb
mongodb_mms_group_id: ""
mongodb_mms_api_key: ""
mongodb_mms_base_url: https://mms.mongodb.com

# Log rotation
mongodb_logrotate: yes                             # Rotate mongodb logs.
mongodb_logrotate_options:
  - compress
  - copytruncate
  - daily
  - dateext
  - rotate 7
  - size 10M
```

#### Usage

Add `Stouts.mongodb` to your roles and set vars in your playbook file.

Example:

```yaml

- hosts: all

  roles:
  - Stouts.mongodb

  vars:
    mongodb_conf_port: 27400
```

#### License

Licensed under the MIT License. See the LICENSE file for details.

#### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/Stouts/Stouts.mongodb/issues)!
