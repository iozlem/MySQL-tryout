DELIMITER ;

# Selecting database
USE FinancialDB;

# Creating table named Demograph
CREATE TABLE Demograph (
district_id INT NOT NULL PRIMARY KEY,
a2 VARCHAR(50) NOT NULL,
a3 VARCHAR(25) NOT NULL,
a4 INT NOT NULL,
a5 INT NOT NULL,
a6 INT NOT NULL,
a7 INT NOT NULL,
a8 INT NOT NULL,
a9 INT NOT NULL,
a10 DECIMAL(4, 1) NOT NULL,
a11 INT NOT NULL,
a12 DECIMAL(3, 2),
a13 DECIMAL(3, 2) NOT NULL,
a14 INT NOT NULL,
a15 INT,
a16 INT NOT NULL
);

# Creating table named Client
CREATE TABLE Client (
client_id INT NOT NULL PRIMARY KEY,
birth_number INT NOT NULL,
district_id INT NOT NULL
);

# Creating table named Account
CREATE TABLE Account(
account_id INT NOT NULL PRIMARY KEY,
district_id INT NOT NULL,
frequency VARCHAR(20) NOT NULL,
date DATE NOT NULL
);

# Creating table named Disposition
CREATE TABLE Disposition(
disp_id INT NOT NULL PRIMARY KEY,
client_id INT NOT NULL,
account_id INT NOT NULL,
type VARCHAR(15) NOT NULL
);

# Creating table named CreditCard
CREATE TABLE CreditCard(
card_id INT NOT NULL PRIMARY KEY,
disp_id INT NOT NULL,
type VARCHAR(10) NOT NULL,
issued DATETIME NOT NULL
);

# Creating table named Loan
CREATE TABLE Loan(
loan_id INT NOT NULL PRIMARY KEY,
account_id INT NOT NULL,
date DATE NOT NULL,
amount INT NOT NULL,
duration INT NOT NULL,
payments DECIMAL(6, 2) NOT NULL,
status VARCHAR(1)
);

# Creating table named PermanentOrder
CREATE TABLE PermanentOrder(
order_id INT NOT NULL PRIMARY KEY,
account_id INT NOT NULL,
bank_to VARCHAR(2),
account_to INT NOT NULL,
amount DECIMAL(7,2) NOT NULL,
k_symbol VARCHAR(10)
);

# Creating table named Transactions
CREATE TABLE Transactions(
trans_id INT NOT NULL PRIMARY KEY,
account_id INT NOT NULL,
date DATE NOT NULL,
type VARCHAR(6) NOT NULL,
operation VARCHAR(20),
amount DECIMAL(7, 2) NOT NULL,
balance DECIMAL(8, 2),
k_symbol VARCHAR(50),
bank VARCHAR(2),
account INT
);
