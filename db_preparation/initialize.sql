# Run this script as a user with create database and create user privileges

DELIMITER ;

# Creating a test user with a password
DROP USER 'testuser'@'localhost';
CREATE USER 'testuser'@'localhost' identified by 'a1234';

# Creating a new database
DROP DATABASE FinancialDB;
CREATE DATABASE FinancialDB;
GRANT ALL ON FinancialDB.* to 'testuser'; # Granting access to database for testuser;
