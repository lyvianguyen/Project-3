# -*- coding: utf-8 -*-
"""
Created on Mon Sep 18 20:04:42 2023

@author: aosen
"""
from flask import Flask, jsonify
from flask_cors import CORS
import json
import psycopg2

#response.headers.add("Access-Control-Allow-Origin", "*")

app = Flask(__name__)
CORS(app)
try:
    conn = psycopg2.connect(
        "dbname='project_three_db' user='postgres' host='localhost' password='postgres'")
    print("Connected")
except Exception as e:
    print(e)


@app.route("/")
def welcome():
    return (f"/api/v1.0/<year>/<COD>")


@app.route("/api/v1.0/<year>/<COD>")
def queryStuff(year, COD):
    returner = []
    cursor = conn.cursor()

    test_query = f"SELECT deaths, age_adjusted_death_rate,state FROM data WHERE (cause_name='{COD}' AND year='{year}')"
    cursor.execute(test_query)
    data = cursor.fetchall()

    for row in data:
        query_dict = {"death": row[0], "AADR": row[1], "state": row[2]}
        returner.append(query_dict)

    return json.dumps(returner, default=str)


if __name__ == '__main__':
    app.run(debug=False)
