import pandas as pd

df = pd.read_csv("data.csv")


output = df['Score'].mean()

print(output)
