#tinh tong

print("[ tinh tong cac so nguyen ] ")

start = int(input("bat dau: " ))
stop = int(input ("ket thuc:" ))

result = 0

for i in range(start, stop + 1):
    result += i

print(" ket qua: %d" %(sum(range(start, stop + 1))))
