#loop dictionary

data = {
 "eggs" : 10,
 "fish" : 2

}

for k in data:
    print(k)
    print("key: %s -value: %s" % (k,data[k]))

for k, v in data.items():    
    print("key: %s -value: %s" % (k,v))
