#parameter

def calc(f,data):
    return f(data)
print("length is: ",calc(len,"daichizan")) #length of string
print("sum is: ",calc(sum,[1,2,3]))
print("max is: ",calc(max,[1,2,3]))
print("min is: ",calc(min,[1,2,3]))
