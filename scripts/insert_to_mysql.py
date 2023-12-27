import mysql.connector
import pandas as pd
from enum import Enum
import os

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

cnx = mysql.connector.connect(user='user', password='root',
                              host='127.0.0.1',
                              database='data_analytics')
cursor = cnx.cursor()

def insert_to_stock_prices():
    for filename in os.listdir("aggregated_data"):
        df = pd.read_csv('aggregated_data/' + filename, parse_dates = ['Date'])
        for index, row in df.iterrows():
            try:
                sql = "INSERT INTO StockPrices (date, stock_id, open, high, low, close, volume) VALUES (%s, %s, %s, %s, %s, %s, %s)"
                val = (row["Date"], row["ticker"], row["Open"], row["High"], row["Low"], row["Close/Last"], row["Volume"])
                cursor.execute(sql, val)
            except mysql.connector.Error as err:
                print(row)
                print(err)
    cnx.commit()
    cnx.close()

def insert_to_financial_data_table():
    drop_table_sql = "DROP TABLE IF EXISTS StockFinancialData"
    # TODO: Instead of decimal, change to integer with the consideration that some values are float
    create_table_sql = "CREATE TABLE StockFinancialData (id INT AUTO_INCREMENT PRIMARY KEY, namespace VARCHAR(255), fact VARCHAR(255), value DECIMAL(20, 4), units VARCHAR(255), start_date VARCHAR(255), end_date VARCHAR(255), stock_id VARCHAR(255), year INT, FOREIGN KEY (stock_id) REFERENCES Stocks(id))"
    cursor.execute(drop_table_sql)
    cursor.execute(create_table_sql)
    
    for filename in os.listdir("../aggregated_financial_data/" + Sectors.INFORMATION_TECHNOLOGY.value):
        df = pd.read_csv(f"../aggregated_financial_data/{Sectors.INFORMATION_TECHNOLOGY.value}/{filename}", parse_dates = ['start_date', 'end_date']).iloc[:, 1:]
        for index, row in df.iterrows():
            try:
                sql = "INSERT INTO StockFinancialData (namespace, fact, value, units, start_date, end_date, stock_id, year) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
                val = (row['namespace'], row['fact'], row['value'], row['units'], row['start_date'], row['end_date'], row['stock_id'], row['year'])
                cursor.execute(sql, val)
            except mysql.connector.Error as err:
                print(row)
                print(err)
    cnx.commit()
    cnx.close()

# insert_to_stock_prices()
insert_to_financial_data_table()