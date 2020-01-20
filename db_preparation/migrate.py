#!/usr/bin/env python3

import csv
import os
import re
import mysql.connector


config = {
    'user': 'testuser',
    'password': 'a1234',
    'host': '127.0.0.1',
    'database': 'FinancialDB',
    'raise_on_warnings': True
}

csv_path = './csv_dataset/'

try:
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()
    print(f'Connected to DB: {config["database"]}')

    csv_file_titles = os.listdir(csv_path)

    print(f'Migrating files: {", ".join(csv_file_titles)}')

    for csv_file_title in csv_file_titles:
        table_name = csv_file_title.split('.')[0]

        with open(csv_path + csv_file_title, 'r') as csv_file:
            print(f'Reading {csv_file_title}')
            reader = csv.DictReader(csv_file, delimiter=';')

            for row in reader:
                column_names = [i for i in row.keys()]
                column_names = ','.join(column_names)

                # null values and date formatting are handled
                column_values = ['NULL' if i == '' else "'" + re.sub(r'(\d{2})(\d{2})(\d{2})(?=\s)', r'\g<1>-\g<2>-\g<3>', i) + "'" for i in row.values()]
                column_values = ','.join(column_values)

                add_data = (
                    f'INSERT INTO {table_name} '
                    f'({column_names}) '
                    f'VALUES ({column_values});'
                )

                cursor.execute(add_data)
            cnx.commit()

            print(f'Data from {csv_file_title} is inserted to {config["database"]}')
except mysql.connector.Error as err:
    if err.errno == mysql.connector.errorcode.ER_ACCESS_DENIED_ERROR:
        print('Something is wrong with your user name or password')
    elif err.errno == mysql.connector.errorcode.ER_BAD_DB_ERROR:
        print('Database does not exist. Did you run "initialize.sql"?')
    else:
        print(err)
else:
    cursor.close()
    cnx.close()
    print('Please run "after_migrate.sql"!')
