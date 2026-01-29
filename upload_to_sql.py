import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.engine import URL

# --- CONFIGURATION ---
PWD = 'root@123'  # <--- PUT YOUR PASSWORD HERE

# 1. Create the URL Object (With PORT 3307)
connection_url = URL.create(
    drivername="mysql+pymysql",
    username="root",
    password=PWD,
    host="localhost",
    port=3307,  # <--- THIS IS THE FIX
    database="telco_churn"
)

# 2. Create the Engine
engine = create_engine(connection_url)

# 3. Load and Upload
try:
    print("Reading CSV...")
    df = pd.read_csv('telco_cleaned.csv')

    print(f"Uploading to MySQL on Port 3307... (This might take 10 seconds)")
    df.to_sql(name='customers', con=engine, if_exists='replace', index=False)

    print("SUCCESS! Data uploaded successfully.")

except Exception as e:
    print("\n--- ERROR DETAIL ---")
    print(e)
