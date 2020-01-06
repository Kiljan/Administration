#!/bin/bash
# Set up iptables firewall rules thanks to "http://www.linuceum.com/Server/srvFirewallEx.php"

# Flush all current rules from iptables
iptables -F

# Set default policies for INPUT, FORWARD and OUTPUT chains
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow access for localhost
iptables -A INPUT -i lo -j ACCEPT

# Accept packets belonging to established and related connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Add access from the other computers on our network
iptables -A INPUT -s <IP Address 1> -j ACCEPT
iptables -A INPUT -s <IP Address n> -j ACCEPT

# Open port for SSH
iptables -A INPUT -p tcp -s <IP Address range> --dport 22 -m state --state NEW -j ACCEPT

# List iptables chains with 'iptables -L -v'
iptables -L -v
