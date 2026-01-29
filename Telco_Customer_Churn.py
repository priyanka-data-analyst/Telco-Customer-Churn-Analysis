import pandas as pd

# 1. Load the raw data
# Make sure the filename matches exactly
df = pd.read_csv('WA_Fn-UseC_-Telco-Customer-Churn.csv')

print("Original Data Size:", df.shape)

# 2. THE FIX: Convert 'TotalCharges' to numbers
# 'coerce' means: if you find a blank space, turn it into NaN (Not a Number)
df['TotalCharges'] = pd.to_numeric(df['TotalCharges'], errors='coerce')

# 3. Handle the empty values (replace NaN with 0)
df['TotalCharges'] = df['TotalCharges'].fillna(0)

# 4. Check for duplicates and remove them
df = df.drop_duplicates()

# 5. Save the CLEAN data to a new CSV for MySQL
df.to_csv('telco_cleaned.csv', index=False)

print("SUCCESS: Data cleaned. Saved as 'telco_cleaned.csv'")
print("New Data Size:", df.shape)