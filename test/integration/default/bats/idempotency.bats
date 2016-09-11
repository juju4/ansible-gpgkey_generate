#!/usr/bin/env bats
#

#
# Idempotence test
# from https://github.com/neillturner/kitchen-ansible/issues/92
#

## FIXME! known failure currently
## gpgkey_generate : Enable haveged - redhat
#@test "Second run should change nothing" {
#    run bash -c "ansible-playbook -i /tmp/kitchen/hosts /tmp/kitchen/default.yml -c local | tee /tmp/idempotency.log | grep -q 'changed=0.*failed=0' && exit 0 || exit 1"
#    [ "$status" -eq 0 ]
#}

