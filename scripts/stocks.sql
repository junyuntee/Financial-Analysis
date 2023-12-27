use data_analytics;

CREATE TABLE Industries (
id VARCHAR(30) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE Stocks (
name VARCHAR(50) NOT NULL,
id VARCHAR(5) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE StocksIndustries (
stock_id VARCHAR(5) NOT NULL,
industry_id VARCHAR(30) NOT NULL,
PRIMARY KEY (stock_id, industry_id),
FOREIGN KEY (stock_id) REFERENCES Stocks(id),
FOREIGN KEY (industry_id) REFERENCES Industries(id)
);

CREATE TABLE StockPrices (
id int auto_increment,
date date NOT NULL,
stock_id VARCHAR(30) NOT NULL,
open FLOAT NOT NULL,
high FLOAT NOT NULL,
low FLOAT NOT NULL,
close FLOAT NOT NULL,
volume int NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (stock_id) REFERENCES Stocks(id)
);

INSERT INTO Industries (id)
VALUES 
("Communication Services"),
("Consumer Discretionary"),
("Consumer Staples"),
("Energy"),
("Financials"),
("Health Care"),
("Industrials"),
("Information Technology"),
("Materials"),
("Real Estate"),
("Utilities");


INSERT INTO Stocks (name, id)
VALUES
("Comcast Corporation", "CMCSA"),
("Netflix", "NFLX"),
("T-Mobile US", "TMUS"),
("Verizon Communications Inc.", "VZ" ),
("Walt Disney", "DIS" ),
("Amazon.com Inc.", "AMZN"),
("LVMH Moet Hennessy Louis Vuitton SE", "LVMHF"),
("Tesla Inc.", "TSLA"),
("The Home Depot Inc.", "HD"),
("Toyota Motor Corp", "TM"),
("Coca-Cola Co (KO)", "KO"),
("Costco Wholesale Corp (COST)", "COST"),
("Nestle SA (NSRGY)", "NSRGY"),
("Procter & Gamble Co (PG)", "PG"),
("Walmart Inc (WMT)", "WMT"),
("Brookfield Renewable (BEP)", "BEP"),
("Chevron Corp (CVX)", "CVX"),
("Exxon Mobil Corp (XOM)", "XOM"),
("NextEra Energy (NEE)", "NEE"),
("Shell PLC (SHEL)", "SHEL"),
("Berkshire Hathaway Inc. (BRK.B)", "BRK.B"),
("Industrial and Commercial Bank of China (IDCBY)", "IDCBY"),
("JPMorgan Chase & Co. (JPM)", "JPM"),
("Mastercard Inc. (MA)", "MA"),
("Visa Inc. (V)", "V"),
("Abbott Laboratories (ABT)", "ABT"),
("Amgen Inc. (AMGN)", "AMGN"),
("Eli Lilly and Co. (LLY)", "LLY"),
("Merck & Co. Inc. (MRK)", "MRK"),
("Pfizer Inc. (PFE)", "PFE"),
("Caterpillar Inc. (CAT)", "CAT"),
("General Electric (GE)", "GE"),
("Honeywell International Inc. (HON)", "HON"),
("Union Pacific Corp. (UNP)", "UNP"),
("United Parcel Service Inc. (UPS)", "UPS"),
("Apple Inc (AAPL)", "AAPL"),
("Alphabet Inc Class A (GOOGL)", "GOOGL"),
("Meta Platforms Inc (META)", "META"),
("Microsoft Corp (MSFT)", "MSFT"),
("NVIDIA Corp (NVDA)", "NVDA"),
("Air Products and Chemicals, Inc. (APD)", "APD"),
("BHP Group Ltd (BHP)", "BHP"),
("Freeport-McMoRan Inc. (FCX)", "FCX"),
("Southern Copper Corporation (SCCO)", "SCCO"),
("The Sherwin-Williams Company (SHW)", "SHW"),
("American Tower Corporation (AMT)", "AMT"),
("Equinix (EQIX)", "EQIX"),
("Prologis (PLD)", "PLD"),
("Public Storage (PSA)", "PSA"),
("Welltower Inc. (WELL)", "WELL"),
("American Electric Power Company, Inc. (AEP)", "AEP"),
("Duke Energy Corporation (DUK)", "DUK"),
("Sempra (SRE)", "SRE"),
("The Southern Company (SO)", "SO");

INSERT INTO StocksIndustries (stock_id, industry_id)
VALUES
("CMCSA", "Communication Services"),
("NFLX", "Communication Services"),
("TMUS", "Communication Services"),
("VZ", "Communication Services"),
("DIS", "Communication Services"),
("AMZN", "Consumer Discretionary"),
("LVMHF", "Consumer Discretionary"),
("TSLA", "Consumer Discretionary"),
("HD", "Consumer Discretionary"),
("TM", "Consumer Discretionary"),
("KO", "Consumer Staples"),
("COST", "Consumer Staples"),
("NSRGY", "Consumer Staples"),
("PG", "Consumer Staples"),
("WMT", "Consumer Staples"),
("BEP", "Energy"),
("CVX", "Energy"),
("XOM", "Energy"),
("NEE", "Energy"),
("SHEL", "Energy"),
("BRK.B", "Financials"),
("IDCBY", "Financials"),
("JPM", "Financials"),
("MA", "Financials"),
("V", "Financials"),
("ABT", "Health Care"),
("AMGN", "Health Care"),
("LLY", "Health Care"),
("MRK", "Health Care"),
("PFE", "Health Care"),
("CAT", "Industrials"),
("GE", "Industrials"),
("HON", "Industrials"),
("UNP", "Industrials"),
("UPS", "Industrials"),
("AAPL", "Information Technology"),
("GOOGL", "Information Technology"),
("META", "Information Technology"),
("MSFT", "Information Technology"),
("NVDA", "Information Technology"),
("APD", "Materials"),
("BHP", "Materials"),
("FCX", "Materials"),
("SCCO", "Materials"),
("SHW", "Materials"),
("AMT", "Real Estate"),
("EQIX", "Real Estate"),
("PLD", "Real Estate"),
("PSA", "Real Estate"),
("WELL", "Real Estate"),
("AEP", "Utilities"),
("DUK", "Utilities"),
("NEE", "Utilities"),
("PSA", "Utilities"),
("WELL", "Utilities");

