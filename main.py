import logging
import psycopg2
from faker import Faker
from random import randint
from psycopg2 import DatabaseError

fake = Faker('uk-Ua')

# Database connection
conn = psycopg2.connect(host='localhost', database='postgres', user='postgres', password='pass')
cur = conn.cursor()

# Entering the data of the "groups" table
for _ in range(3):
    cur.execute("INSERT INTO groups (name) VALUES (%s)", (fake.word(),))

# Entering the data of the "teachers" table
for _ in range(3):
    cur.execute("INSERT INTO teachers (fullname) VALUES (%s)", (fake.name(),))

# Addition of the "subjects" tables with the teacher's indication
for teacher_id in range(1, 4):
    for _ in range(2):
        cur.execute("INSERT INTO subjects (name, teacher_id) VALUES (%s, %s)", (fake.word(), teacher_id))

# Entering the data of the "students" and "grades" tables
for group_id in range(1, 4):
    for _ in range(10):
        cur.execute("INSERT INTO students (fullname, group_id) VALUES (%s, %s) RETURNING id",
                    (fake.name(), group_id))
        student_id = cur.fetchone()[0]
        for subject_id in range(1, 7):
            for _ in range(3):
                cur.execute("INSERT INTO grades (student_id, subject_id, grade, grade_date) VALUES (%s, %s, %s, %s)",
                        (student_id, subject_id, randint(0, 100), fake.date_this_decade()))

# Saving changes
try:
    conn.commit()
except DatabaseError as error:
    logging.error(error)
    conn.rollback()
finally:
    # Closing the connection
    cur.close()
    conn.close()
