'''
Script to load data to PostgreSQL database
'''

import pandas as pd
from sqlalchemy import create_engine

engine = create_engine('postgresql://postgres:2004@localhost:5432/dealership_analytics')
df = pd.read_csv('data/cleaned_us_cars_auction.csv')
df.to_sql('inventory_pricing', engine, if_exists='replace', index=False) 

print("Data loaded successfully to PostgreSQL database.")