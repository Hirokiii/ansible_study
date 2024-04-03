Study materials: https://www.youtube.com/watch?v=3RiVKs8GHYQ&list=PLT98CRl2KxKEUHie1m24-wkyHpEsa4Y70


## Learned commands
```sh
# Check the all inventory status
$ ansible all -i inventory -m ping # without ansible.cfg
$ ansible all -m ping # with ansible.cfg, "-m" stands for module.

# Collect all the server infomation
$ ansible all -m gather_facts

# Collect the only-one server infomation
$ ansible all -m gather_facts --limit <ip>

# Give the sudo privilege, assuming the pass for all servers are the same
# update_cache->apt-get update: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html
$ ansible all -m apt -a update_cache=true --become --ask-become-pass

# Install applications
$ ansible all -m apt -a name=vim-nox --become --ask-become-pass
$ ansible all -m apt -a name=tmux --become --ask-become-pass

# with multiple arguments
$ ansible all -m apt -a "name=snapd state=latest" --become --ask-become-pass
```