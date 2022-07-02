[![Actions Status - Master](https://github.com/juju4/ansible-gpgkey_generate/workflows/AnsibleCI/badge.svg)](https://github.com/juju4/ansible-gpgkey_generate/actions?query=branch%3Amaster)
[![Actions Status - Devel](https://github.com/juju4/ansible-gpgkey_generate/workflows/AnsibleCI/badge.svg?branch=devel)](https://github.com/juju4/ansible-gpgkey_generate/actions?query=branch%3Adevel)

# ansible role to generate gpg keys

A simple ansible role to generate gpg keys automatically and with sane secure defaults

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.5

### Operating systems

Tested on Ubuntu 14.04, 16.04, 18.04 and centos7

## Example Playbook

Just include this role in your list.
For example

```
- hosts: all
  roles:
    - { role: juju4.gpgkey_generate, gpg_user: dupont, gpg_realname: 'Dupont', gpg_useremail: 'dupont@localhost', gpg_pubkeyfile: 'dupont.pub', gpg_privkeyfile: 'dupont.priv' }
    - { role: juju4.gpgkey_generate, gpg_user: dupond, gpg_realname: 'dupond', gpg_useremail: 'dupond@localhost', gpg_pubkeyfile: 'dupond.pub', gpg_privkeyfile: 'dupond.priv' }
```

By default, role is retrieving armored public key and fingerprint to orchestrator while leaving secret key on hosts.

## Variables

Complete list of available variables can be found in
[defaults/main.yml](defaults/main.yml).

Notable variables are:
```
gpg_generator_user: "{{ ansible_user }}"
gpg_user: "{{ ansible_user }}"

gpg_realname: "GPG Ansible user"
gpg_useremail: "{{ gpg_user }}@localhost"
gpg_passphrase: "Passphrase_example.CHANGE_ME!"

gpg_keylength: 2048
gpg_subkeylength: 2048
gpg_expire: 360
```

## Continuous integration

You can use test-kitchen.

```
$ cd /path/to/roles/juju4.gpgkey_generate
$ kitchen verify
$ kitchen login
```

* Travis test has been reviewed to use docker as multi-platform test.
Because of limitations, some shims are put in place like mapping /dev/urandom to /dev/random so gpg key generation can happen. Normally rng-tools or haveged are taking care of that.


## License

BSD 2-clause
