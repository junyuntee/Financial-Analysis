import pandas as pd
from enum import Enum
import os
import numpy as np

class Sectors(Enum):
    COMMUNICATION_SERVICES = 'Communication Services'
    CONSUMER_DISCRETIONARY = 'Consumer Discretionary'
    CONSUMER_STAPLES = 'Consumer Staples'
    ENERGY = 'Energy'
    FINANCIALS = 'Financials'
    HEALTH_CARE = 'Health Care'
    INDUSTRIALS = 'Industrials'
    INFORMATION_TECHNOLOGY = 'Information Technology'
    MATERIALS = 'Materials'
    REAL_ESTATE = 'Real Estate'
    UTILITIES = 'Utilities'


def convert_string_to_float(column):
    return column.str.replace('$', '').astype(float)

def convert_date_format(column):
    return column.dt.strftime('%Y-%m-%d')

def add_column(df, filename):
    ticker = filename.split()[-1].split('.csv')[0].strip('()')
    df['ticker'] = ticker
    return df

def export_to_csv(df, filename):
    df.to_csv('aggregated_data/' + filename + '.csv', index = False)

def replace_na(df):
    df.fillna(0, inplace = True)
    return df

def execute_functions():
    for sector in list(Sectors):
        for filename in os.listdir(sector.value):
            df = pd.read_csv(sector.value + '/' + filename, parse_dates = ['Date'], na_values=['N/A'])
            # Convert to float
            df['Close/Last'] = convert_string_to_float(df['Close/Last'])
            df['Open'] = convert_string_to_float(df['Open'])
            df['High'] = convert_string_to_float(df['High'])
            df['Low'] = convert_string_to_float(df['Low'])
            # Convert to Date
            df['Date'] = convert_date_format(df['Date'])
            # Add Column
            df = add_column(df, filename)
            # Replace N/A with 0
            df = replace_na(df)
            # Export to CSV
            export_to_csv(df, filename.split('.csv')[0])

execute_functions()