import requests
import json

# replace the "demo" apikey below with your own key from https://www.alphavantage.co/support/#api-key
url = 'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&tickers=AAPL&time_from=20200410T0130&time_to=20231103T0000&limit=1000&apikey=BF6DJPE58GXT26NL'
# url = 'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&tickers=NVDA&apikey=BF6DJPE58GXT26NL&time_from=20231205T064223&time_to=20231205T064223&limit=1000'
r = requests.get(url)
data = r.json()
with open('../news-sentiment-nvda.json', 'w') as file:
    json.dump(data,file)
