# Battle Rules
num_knights = int(input('Enter number of knights '))
day = input('Enter day of the week ')
enemy = input('Enter type of enemy ')

if enemy == 'killer bunny':
    print('Holy Hand Granade!')
else:
    # Original rules
    if num_knights < 3 or day == 'Monday':
        print('Retreat!')
    if num_knights >= 10 and day == 'Wednesday':
        print('Trojan Rabbit!')
    else:
        print('Truce?')