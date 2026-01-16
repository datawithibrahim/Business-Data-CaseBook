import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


cleaned_data = pd.read_csv("Supply_Chain/dataset/cleaned_logistics_dataset.csv")

num_cols = [
        'Inventory_Level',
        'Temperature',
        'Humidity',
        'Waiting_Time',
        'User_Transaction_Amount',
        'User_Purchase_Frequency',
        'Asset_Utilization',
        'Demand_Forecast'
    ]
for col in num_cols:
    plt.figure(figsize=(6,4))
    sns.histplot(cleaned_data[col], bins=10, kde=True)
    plt.title(f'Distribution of {col}')
plt.show()