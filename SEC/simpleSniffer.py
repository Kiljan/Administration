#!/usr/bin/python

# Filter ensures that only ARP packets get sniffed.
# Other possible filters would be e.g. tcp and port 80 The documentation of the PCAP filter language can be found on tcpdump.org

import sys
import getopt
import pcapy
from impacket.ImpactDecoder import EthDecoder

dev = "eth0"
filter = "arp"
decoder = EthDecoder()

# This function will be called for every packet
# and just print it
def handle_packet(hdr, data):
  print decoder.decode(data)
  
  
def usage():
  print sys.argv[0] + " -i <dev> -f <pcap_filter>"
  sys.exit(1)


# Parsing parameter
try:
  cmd_opts = "f:i:"
  opts, args = getopt.getopt(sys.argv[1:], cmd_opts)
except getopt.GetoptError:
  usage()
  
  
for opt in opts:
  if opt[0] == "-f":
    filter = opt[1]
  elif opt[0] == "-i":
    dev = opt[1]
  else:
    usage()

# Open device in promisc mode
# The parameters for open_live() are snaplen to define how many bytes of a packets payload should be read, 
# a boolean value for setting the promiscuous mode and a timeout in milliseconds beside the network interface to read from.
pcap = pcapy.open_live(dev, 1500, 0, 100)

# Set pcap filter
pcap.setfilter(filter)

# Start sniffing
pcap.loop(0, handle_packet)
