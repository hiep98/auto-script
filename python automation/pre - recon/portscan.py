from scapy.all import *

port = [25,803,443,445,8080,8443]

def SynScan(host):
    ans,uans = sr(IP(dst=host)/TCP(dport=ports,flags="S"),timeout=2,verbose=0)
    print("open ports at %s:" % host)
    for (s,r,) in ans:
        if s[TCP].dport == r[TCP].sport:
            print(s[TCP].dport)

def DNSScan(host):
     ans,uans = sr(IP(dst=host)/UDP(dport=53)/DNS(rd=1,qd=DNSQR(qname="goggle.com")),timeout=2,verbose=0)
     if ans:
         print("DNS SERVER at%s" %host)


host="8.8.8.8"

SynScan(host)
DNSScan(host)

