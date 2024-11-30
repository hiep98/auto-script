# Import library
from socket import *
# Enter the IP address
target = input("Enter host to scan: ")
targetIP = gethostbyname(target)
print("Starting scan on host ", targetIP)

# Use sockets to scan ports 1 - 1025
for i in range(1, 59088):
    s = socket(AF_INET, SOCK_STREAM)
    s.settimeout(5)
    result = s.connect_ex((targetIP, i))
    if(result == 0) :
        print('Port %d: OPEN' % (i,))
    s.close()
