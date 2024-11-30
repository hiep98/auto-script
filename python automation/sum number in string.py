#tinh tong

print("[ tinh tong cac chu so cua mot so nguyen ] ")
number = input("nhap so:")
result = 0
for i in list(number):
    result += int(i)

print(" ket qua: %d" % result)
