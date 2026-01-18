import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

sns.set_style("whitegrid")

def load_and_clean_data():
    data = pd.read_csv("Supply_Chain/dataset/smart_logistics_dataset.csv")
    print("\nDataset Preview:")
    print(data.head())
    print("\nMissing Values:")
    print(data.isnull().sum())
    data["Logistics_Delay_Reason"].fillna("Unknown", inplace=True)
    data["Timestamp"] = pd.to_datetime(data["Timestamp"])
    return data


def delay_reason_plot(data):
    plt.figure(figsize=(7,4))
    sns.countplot(data=data, x="Logistics_Delay_Reason", palette="Set2")
    plt.title("Logistics Delay Reasons")
    plt.xticks(rotation=45)
    plt.savefig('delay_reason.png', dpi=300, bbox_inches='tight')
    plt.show()

def inventory_distribution(data):
    plt.figure(figsize=(6,4))
    sns.histplot(data["Inventory_Level"], bins=15, color="blue", kde=True)
    plt.title("Inventory Level Distribution")
    plt.savefig('inventory_distribution.png', dpi=300, bbox_inches='tight')
    plt.show()

def transaction_violin(data):
    plt.figure(figsize=(6,4))
    sns.violinplot(data=data, y="User_Transaction_Amount", color="orange")
    plt.title("Transaction Amount Distribution")
    plt.savefig('transaction_violin.png', dpi=300, bbox_inches='tight')
    plt.show()

def demand_vs_utilization(data):
    plt.figure(figsize=(6,4))
    sns.scatterplot(
        data=data,
        x="Demand_Forecast",
        y="Asset_Utilization",
        hue="Logistics_Delay",
        palette="coolwarm"
    )
    plt.title("Demand vs Asset Utilization")
    plt.savefig('demand_vs_utilization.png', dpi=300, bbox_inches='tight')
    plt.show()

def purchase_frequency_plot(data):
    plt.figure(figsize=(6,4))
    sns.countplot(x="User_Purchase_Frequency", data=data, palette="viridis")
    plt.title("User Purchase Frequency")
    plt.savefig('purchase_frequency.png', dpi=300, bbox_inches='tight')
    plt.show()

def correlation_heatmap(data):
    plt.figure(figsize=(10,6))
    corr = data.select_dtypes(include="number").corr()
    sns.heatmap(corr, annot=True, cmap="coolwarm", fmt=".2f")
    plt.title("Feature Correlation Heatmap")
    plt.savefig('correlation_heatmap.png', dpi=300, bbox_inches='tight')
    plt.show()

def asset_location_plot(data):
    plt.figure(figsize=(6,4))
    plt.scatter(
        data["Longitude"],
        data["Latitude"],
        c="green",
        alpha=0.6
    )
    plt.xlabel("Longitude")
    plt.ylabel("Latitude")
    plt.title("Asset Location Distribution")
    plt.savefig('asset_allocation.png', dpi=300, bbox_inches='tight')
    plt.show()


if __name__ == "__main__":
    df = load_and_clean_data()
    delay_reason_plot(df)
    inventory_distribution(df)
    transaction_violin(df)
    demand_vs_utilization(df)
    purchase_frequency_plot(df)
    correlation_heatmap(df)
    asset_location_plot(df)
