import math
a = int(input('nhap a: '))
b = int(input('nhap b: '))
c = int(input('nhap c: '))

if a>0 and b>0 and c>0:
    if a+b>c and a+c>b and b+c>a:
        print ("day la 3 cang")
        s= (a+b+c)/2
        print ("dien tich tam giac:", math.sqrt(s*(s-a)*(s-b)*(s-c)))
    else:
        print("0 phai tam giac")
else:
    print("0 phai nguyen duong")
