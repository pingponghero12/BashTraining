import csv

def calc_avrg(filename):
    with open(filename, newline='') as csvfile:
        reader = csv.DictReader(csvfile)
        score = [int(row['Score']) for row in reader]
        return sum(score) / len(score)

average = calc_avrg('data.csv')

print(average)
