li1 = [1, 2, 3, 4, 5]
li2 = [2, 4, 5]
 
diff = []
for element in li1:
    if element not in li2:
        diff.append(element)
 
print(diff)