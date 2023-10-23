tup=(1,3,4,32,1,1,1,31,32,12,21,2,3)  
for i in tup:
    if tup.count(i) > 1:
        print(i,"is repeated",tup.count(i),"times")