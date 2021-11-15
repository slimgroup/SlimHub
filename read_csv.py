import csv

with open('attendance.csv', 'r', newline='') as csvfile:
    lines = csv.reader(csvfile, delimiter = ',', quotechar = '|')
    for line in lines:
        try:
           print([c for c in line if '@' in c][0].strip())
        except IndexError:
            pass