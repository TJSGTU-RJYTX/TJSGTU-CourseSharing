import csv

txt_file = "/Users/mengfanjun/Desktop/mfj/LearnPython/prj3/data_analysis-master/原始数据及清洗后的数据/原始数据/tjershoufang-v1.0.2.txt"
csv_file = "output.csv"

with open(txt_file, "r") as txt_file:
    lines = txt_file.readlines()

data = [line.strip().split(",") for line in lines]

with open(csv_file, "w", newline="") as csv_file:
    writer = csv.writer(csv_file)
    for row in data:
        writer.writerow(row)

print("Conversion complete.")
