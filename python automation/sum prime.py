#tinh tong

print("[ check prime ] ")
number = int(input("type input number:"))

if number < 2:
    print("input number need > 2")
    exit()

is_prime = True

for i in range(2,int(number /2 + 1)):
    if number % i == 0:
        is_prime = False
        break

if is_prime:
        print("number %d is prime" % number)
        
else:
        print("number %d is not prime" % number)
        
