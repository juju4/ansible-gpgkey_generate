[![Build Status - Master](https://travis-ci.org/juju4/ansible-gpgkey_generate.svg?branch=master)](https://travis-ci.org/juju4/ansible-gpgkey_generate)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-gpgkey_generate.svg?branch=devel)](https://travis-ci.org/juju4/ansible-gpgkey_generate/branches)

# ansible role to generate gpg keys

A simple ansible role to generate gpg keys automatically and with sane secure defaults

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0

### Operating systems

Verified with kitchen against ubuntu14 and centos7

## Example Playbook

Just include this role in your list.
For example

```
- hosts: all
  roles:
    - { role: gpgkey_generate, gpg_user: dupont, gpg_realname: 'Dupont', gpg_useremail: 'dupont@localhost', gpg_pubkeyfile: 'dupont.pub', gpg_privkeyfile: 'dupont.priv' }
    - { role: gpgkey_generate, gpg_user: dupond, gpg_realname: 'dupond', gpg_useremail: 'dupond@localhost', gpg_pubkeyfile: 'dupond.pub', gpg_privkeyfile: 'dupond.priv' }
```

By default, role is retrieving armored public key and fingerprint to orchestrator while leaving secret key on hosts.

## Variables

```
gpg_user: "{{ ansible_ssh_user }}"
gpg_realname: "GPG Ansible user"
#gpg_userhome:
gpg_useremail: "{{ gpg_user }}@localhost"
gpg_pubkeyfile: "{{ gpg_user }}.pub"
gpg_privkeyfile: "{{ gpg_user }}.priv"
gpg_pubkeyfileexport: "{{ gpg_user }}.asc"
gpg_fingerprint: "{{ gpg_user }}-fingerprint"

gpg_keylength: 2048
gpg_subkeylength: 2048
gpg_expire: 360

## recover files on orchestrator?
gpg_pull: true

```

## Continuous integration

You can use test-kitchen.

```
$ cd /path/to/roles/gpgkey_generate
$ kitchen verify
$ kitchen login
```

* Travis test has been reviewed to use docker as multi-platform test.
Because of limitations, some shims are put in place like mapping /dev/urandom to /dev/random so gpg key generation can happen. Normally rng-tools or haveged are taking care of that.


## Troubleshooting & Known issues

None

## License

BSD 2-clause



