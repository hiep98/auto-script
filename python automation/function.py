def sm(lst):
    sm = 0
    for i in lst:
        sm += 1
    return sm

result = sum([1,2,3])
print("result is: " + str(result))

def sm(lst,start = 0):
     sm = 0
     i = start
     while  i < len(lst):
         sm += lst[i]
         i += 1
     return sm

result = sm([1,2,3],2)
print("result is: " + str(result))
    

