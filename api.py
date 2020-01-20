from flask import Flask, request
from flask_restful import Api, Resource
import mysql.connector


app = Flask(__name__)
api = Api(app=app)

config = {
    'user': 'testuser',
    'password': 'a1234',
    'host': '127.0.0.1',
    'database': 'FinancialDB',
    'raise_on_warnings': True
}

class Account(Resource):

    def get(self):
        try:
            cnx = mysql.connector.connect(**config)
            cursor = cnx.cursor()

            acc_id = request.args.get('account_id')

            if (acc_id != None):
                cursor.execute('SELECT * FROM Account WHERE account_id=' + acc_id)
            else:
                cursor.execute('SELECT * FROM Account')

            results = cursor.fetchall()

            cursor.close()
            cnx.close()

            accounts = []

            for result in results:
                accounts.append({
                    'account_id': result[0],
                    'district_id': result[1],
                    'frequency': result[2],
                    'date': result[3].strftime('%y-%m-%d %H:%M:%S')
                })

            return { "data": accounts }
        except mysql.connector.Error as err:
            if err.errno == mysql.connector.errorcode.ER_ACCESS_DENIED_ERROR:
                print('Something is wrong with your user name or password')
            elif err.errno == mysql.connector.errorcode.ER_BAD_DB_ERROR:
                print('Database does not exist. Did you run "initialize.sql"?')
            else:
                print(err)


api.add_resource(Account, '/account')

if __name__ == '__main__':
    app.run(debug=True)