Study materials: https://www.youtube.com/watch?v=3RiVKs8GHYQ&list=PLT98CRl2KxKEUHie1m24-wkyHpEsa4Y70


## Learned commands
```sh
# Check the all inventory status
$ansible all -i inventory -m ping # without ansible.cfg
$ansible all -m ping # with ansible.cfg, "-m" stands for module.

# Collect all the server infomation
$ansible all -m gather_facts

# Collect the only-one server infomation
$ansible all -m gather_facts --limit <ip>
```