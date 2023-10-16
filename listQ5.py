def findSecondSmallest(lst):
    temp_lst = lst.copy()
    temp_lst.sort()
    return temp_lst[1]
print(findSecondSmallest([1, 2, -8, -2, 0, -2]))
print(findSecondSmallest([1, 1, 0, 0, 2, -2, -2]))
print(findSecondSmallest([1, 1, 0, 0, 2, -2, ]))