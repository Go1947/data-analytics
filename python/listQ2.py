duplicate = [2,3,4,2,5,6,7,5,8,9,7]
final_list = []
for num in duplicate:
 if num not in final_list:
  final_list.append(num)
print(final_list)