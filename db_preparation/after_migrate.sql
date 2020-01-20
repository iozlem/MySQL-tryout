DELIMITER ;

# Selecting database
USE FinancialDB;

# Adjusting FK for Client
ALTER TABLE Client
ADD CONSTRAINT FK_ClientDistrict FOREIGN KEY (district_id) REFERENCES Demograph(district_id);

# Adjusting FK for Account
ALTER TABLE Account
ADD CONSTRAINT FK_AccountDistrict FOREIGN KEY(district_id) REFERENCES Demograph(district_id);

# Adjusting FK for Disposition
ALTER TABLE Disposition
ADD CONSTRAINT FK_DispositionClient FOREIGN KEY (client_id) REFERENCES Client(client_id);

ALTER TABLE Disposition
ADD CONSTRAINT FK_DispositionAccount FOREIGN KEY (account_id) REFERENCES Account(account_id);

# Adjusting FK for CreditCard
ALTER TABLE CreditCard
ADD CONSTRAINT FK_CreditDisposition FOREIGN KEY (disp_id) REFERENCES Disposition(disp_id);

# Adjusting FK for Loan
ALTER TABLE Loan
ADD CONSTRAINT FK_LoanAccount FOREIGN KEY (account_id) REFERENCES Account(account_id);

# Adjusting FK for PermanentOrder
ALTER TABLE PermanentOrder
ADD CONSTRAINT FK_OrderAccount FOREIGN KEY (account_id) REFERENCES Account(account_id);

# Adjusting FK for Transactions
ALTER TABLE Transactions
ADD CONSTRAINT FK_TransactionsAccount FOREIGN KEY (account_id) REFERENCES Account(account_id);
