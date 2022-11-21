import csv

for registered in ['attendance.csv', 'remotes-users.csv']:
    with open(registered, 'r', newline='') as csvfile:
        lines = csv.reader(csvfile, delimiter = ',', quotechar = '|')
        for line in lines:
            try:
                print([c for c in line if '@' in c][0].strip())
            except IndexError:
                pass
