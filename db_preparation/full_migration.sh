#!/usr/bin/env bash

mysql -u root -p FinancialDB < initialize.sql
mysql -u root -p FinancialDB < before_migrate.sql
python migrate.py
mysql -u root -p FinancialDB < after_migrate.sql