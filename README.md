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
# -K (--ask-become-pass)
$ ansible all -m apt -a update_cache=true --become -K

# Install applications
$ ansible all -m apt -a name=vim-nox --become -K
$ ansible all -m apt -a name=tmux --become -K

# with multiple arguments
$ ansible all -m apt -a "name=snapd state=latest" --become -K

# Run a playbook
$ ansible-playbook -K .yml

# List tags
$ ansible-playbook --list-tags .yml

# RUn only the tagged tasks
$ ansible-playbook -K --tags "<tag1>, <tag2>" .yml
```