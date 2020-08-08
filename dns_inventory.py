#!/usr/bin/env python3

import dns.resolver
import argparse
import sys
from collections import defaultdict
import json

# The domain we are querying.
domain = 'domain.com'
# We sort results in reverse alphabetical order to make parsing easier.
records = sorted(dns.resolver.query(domain, 'TXT'), reverse=True)

class DNSInventory(object):

    def __init__(self):
        self.inventory = {}
        self.read_cli_args()

        # Called with `--list`.
        if self.args.list:
            self.inventory = self.dns_inventory()
        # Called with `--host [hostname]`.
        elif self.args.host:
            # Not implemented, since we return _meta info `--list`.
            self.inventory = self.empty_inventory()
        # If no groups or vars are present, return an empty inventory.
        else:
            self.inventory = self.empty_inventory()
        #with open('ffff','w') as f:
        #    f.write(json.dumps(self.inventory))

        print(json.dumps(self.inventory, indent=4))

    # Generate our DNS inventory
    def dns_inventory(self):
        inventory = defaultdict(list)
        for record in records:
            store = {}
            stripquotes = str(record).replace('"', '')
            data = str(stripquotes).replace(' ', '').split(';')
            for item in data:
                key, value = str(item).split('=')
                store[key] = value
            if 'hostname' in store:
                if 'groups' in store:
                    for group in store['groups'].split(','):
                        if group not in inventory:
                            inventory[group] = {'hosts': []}
                        inventory[group]['hosts'].append(store['hostname'])
                elif 'groups' not in store:
                    if 'ungrouped' not in inventory:
                        inventory['ungrouped'] = {'hosts': []}
                    inventory['ungrouped']['hosts'].append(store['hostname'])
                if 'hostvars' in store:
                    for hostvar in store['hostvars'].split(','):
                        if '_meta' not in inventory:
                            inventory['_meta'] = {'hostvars': {}}
                        if store['hostname'] not in inventory['_meta']['hostvars']:
                            inventory['_meta']['hostvars'][store['hostname']] = {}
                        var, val = hostvar.split(':')
                        inventory['_meta']['hostvars'][store['hostname']].update({var: val})
            elif ('group' in store) and ('vars' in store):
                for group in inventory:
                    if store['group'] == group:
                        if 'vars' not in group:
                            inventory[group].update({'vars': {}})
                        for groupvar in store['vars'].split(','):
                            var, val = groupvar.split(':')
                            inventory[group]['vars'].update({var: val})
        return(inventory)


    # Empty inventory for testing.
    def empty_inventory(self):
        return {'_meta': {'hostvars': {}}}


    # Read the command line args passed to the script.
    def read_cli_args(self):
        parser = argparse.ArgumentParser()
        parser.add_argument('--list', action = 'store_true')
        parser.add_argument('--host', action = 'store')
        self.args = parser.parse_args()

# Get the inventory
DNSInventory()
