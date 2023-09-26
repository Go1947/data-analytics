str = input("Enter the Strings :")
num_upper = 0
for letter in str[:4]: 
 if letter.upper() == letter:
  num_upper += 1
 if num_upper >= 2:
  print(str.upper())
print(str) 