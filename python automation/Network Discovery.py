# Import library
import subprocess
import ipaddress
# Declare var
onl = []
# Enter the network class
net_addr = input("Enter a network address inform[192.168.1.0/24]: ")
# Create network layer
ip_net = ipaddress.ip_network(net_addr)
# Get all the IP addresses in the network layer
all_hosts = list(ip_net.hosts())
# Customize child processes and command prompt
info = subprocess.STARTUPINFO()
info.dwFlags |= subprocess.STARTF_USESHOWWINDOW
info.wShowWindow = subprocess.SW_HIDE
# Each IP address will ping that address
for i in range(len(all_hosts)):
    output = subprocess.Popen(['ping', '-n', '1','-w', '500', str(all_hosts[i])],stdout=subprocess.PIPE,startupinfo=info).communicate()[0]
# If the unresponsive IP address is offline and vice versa.
if "Destination host unreachable" in output.decode('utf-8'):
    print("[+] ", str(all_hosts[i]), "is Offline")
elif "Request timed out" in output.decode('utf-8'):
    print("[+] ", str(all_hosts[i]), "is Offline")
else:
    print("[+] ", str(all_hosts[i]), "is Online")
    onl.append(str(all_hosts[i]))
# Display online hosts
print("-" * 5, " Host Live ", "-" * 5)
for online in onl:
    print("[+] ", online)
