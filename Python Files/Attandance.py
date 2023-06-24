import os
import sys
import time

import psutil
import logging

from flask import Flask, render_template, Response, request, url_for
import cv2
import face_recognition
import numpy as np
from datetime import datetime
import mysql.connector
from PIL import Image
import io
import imutils


app = Flask(__name__)
ses = "FN"
mydb = mysql.connector.connect(
    host="localhost",
    username="root",
    password="",
    database="buspass"
)

mycursor = mydb.cursor()

path = "ImageAttandance"
images = []
classNames = []
myList = os.listdir(path)
print(myList)
for cl in myList:
    curImage = cv2.imread(f'{path}/{cl}')
    images.append(curImage)
    classNames.append(os.path.splitext(cl)[0])

print(classNames)


def findEncodingImg(images):
    encodeList = []
    for img in images:
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        encode = face_recognition.face_encodings(img)[0]
        encodeList.append(encode)
    return encodeList

msg = ""
known_face_encodings = findEncodingImg(images)
print("Encoding completed.........")
# ----------------------------------------------------------------------
camera = cv2.VideoCapture(0)
period_data = ["08:30:00","08:40:00","09:15:00","09:25:00","10:00:00","10:15:00","11:05:00","11:15:00","11:25:00","12:50:00","13:10:00","13:20:00","13:30:00","14:05:00","14:15:00","15:10:00","15:20:00","15:50:00"]
def gen_frames():
    camera = cv2.VideoCapture(0);
    while True:
        success, frame = camera.read()
        frame = imutils.resize(frame, width=800)
        if not success:
            break
        else:
            #date time
            cur_time = datetime.now().time()
            now = datetime.now()
            cur_date = now.strftime("%Y-%m-%d")

            small_frame = cv2.resize(frame, (0, 0), fx=0.20, fy=0.20)
            rgb_small_frame = small_frame[:, :, ::-1]


            face_locations = face_recognition.face_locations(frame)
            face_encodings = face_recognition.face_encodings(frame, face_locations)
            face_names = []
            print(face_locations)
            for face_encoding in face_encodings:
                # See if the face is a match for the known face(s)
                print("inside for - loop face encoding")
                matches = face_recognition.compare_faces(known_face_encodings, face_encoding)
                name = "Unknown"
                # face_distance
                face_distances = face_recognition.face_distance(known_face_encodings, face_encoding)
                best_match_index = np.argmin(face_distances)
                checker = False
                time_index = 0
                for i in range(0, len(period_data), 2):
                    start_time = period_data[i]
                    start = datetime.strptime(start_time, '%H:%M:%S').time()
                    stop_time = period_data[i + 1]
                    stop = datetime.strptime(stop_time, '%H:%M:%S').time()
                    checker = time_in_range(start, stop, cur_time,i)
                    if checker:
                        time_index = i
                        break;
                if checker:
                    if matches[best_match_index]:
                        name = classNames[best_match_index]
                        print(name)
                        sqlsel = "SELECT * FROM attendance WHERE RegNo='"+name+"' AND Date='"+cur_date+"'"
                        mycursor.execute(sqlsel)
                        row = mycursor.fetchone()
                        if row is not None:
                            print("Update for the user")
                            val = (1,name,cur_date)
                            # if time_index == 0:
                            #     sql = "UPDATE attendance SET Period_1=%s WHERE RegNo=%s AND Date=%s"
                            # elif time_index == 1:
                            #     sql = "UPDATE attendance SET Period_2=%s WHERE RegNo=%s AND Date=%s"
                            # elif time_index == 2:
                            #     sql = "UPDATE attendance SET Period_3=%s WHERE RegNo=%s AND Date=%s"
                            # elif time_index == 3:
                            #     sql = "UPDATE attendance SET Period_4=%s WHERE RegNo=%s AND Date=%s"
                            # elif time_index == 4:
                            #     sql = "UPDATE attendance SET Period_5=%s WHERE RegNo=%s AND Date=%s"
                            # elif time_index == 5:
                            #     sql = "UPDATE attendance SET Period_6=%s WHERE RegNo=%s AND Date=%s"
                            # elif time_index == 6:
                            #     sql = "UPDATE attendance SET Period_7=%s WHERE RegNo=%s AND Date=%s"
                            # elif time_index == 7:
                            #     sql = "UPDATE attendance SET Period_8=%s WHERE RegNo=%s AND Date=%s"
                            # elif time_index == 8:
                            sql = "UPDATE attendance SET Period_6=%s WHERE RegNo=%s AND Date=%s"
                            mycursor.execute(sql, val)
                            mydb.commit()
                            print("Period Wise Attendance Updated successfully.")
                        else:
                            print(time_index)
                            # if time_index == 0:
                            #     sql = "INSERT INTO attendance(RegNo,Date,Period_1) VALUES(%s,%s,%s)"
                            #     val = (name, cur_date, 1)
                            #     mycursor.execute(sql, val)
                            # elif time_index == 1:
                            #     sql = "INSERT INTO attendance(RegNo,Date,Period_2) VALUES(%s,%s,%s)"
                            #     val = (name, cur_date, 1)
                            #     mycursor.execute(sql, val)
                            # elif time_index == 2:
                            #     sql = "INSERT INTO attendance(RegNo,Date,Period_3) VALUES(%s,%s,%s)"
                            #     val = (name, cur_date, 1)
                            #     mycursor.execute(sql, val)
                            # elif time_index == 3:
                            #     sql = "INSERT INTO attendance(RegNo,Date,Period_4) VALUES(%s,%s,%s)"
                            #     val = (name, cur_date, 1)
                            #     mycursor.execute(sql, val)
                            # elif time_index == 4:
                            #     sql = "INSERT INTO attendance(RegNo,Date,Period_5) VALUES(%s,%s,%s)"
                            #     val = (name, cur_date, 1)
                            #     mycursor.execute(sql, val)
                            # elif time_index == 5:
                            #     sql = "INSERT INTO attendance(RegNo,Date,Period_6) VALUES(%s,%s,%s)"
                            #     val = (name, cur_date, 1)
                            #     mycursor.execute(sql, val)
                            # elif time_index == 6:
                            #     sql = "INSERT INTO attendance(RegNo,Date,Period_7) VALUES(%s,%s,%s)"
                            #     val = (name, cur_date, 1)
                            #     mycursor.execute(sql, val)
                            # elif time_index == 7:
                            #     sql = "INSERT INTO attendance(RegNo,Date,Period_8) VALUES(%s,%s,%s)"
                            #     val = (name, cur_date, 1)
                            #     mycursor.execute(sql, val)
                            # elif time_index == 8:
                            sql = "INSERT INTO attendance(RegNo,Date,Period_6) VALUES(%s,%s,%s)"
                            val = (name, cur_date, 1)
                            mycursor.execute(sql, val)
                            mydb.commit()
                            print("Attendance Captured")

                    else:
                        print("Unknown")
                else:
                    print("Time -> not in range")

                face_names.append(name)

            # Display the results
            for (top, right, bottom, left), name in zip(face_locations, face_names):
                # Scale back up face locations since the frame we detected in was scaled to 1/4 size
                top *= 5
                right *= 5
                bottom *= 5
                left *= 5

                # Draw a box around the face
                cv2.rectangle(frame, (left, top), (right, bottom), (74, 133, 0), 2)

                # Draw a label with a name below the face
                cv2.rectangle(frame, (left, bottom - 35), (right, bottom), (0,0, 0), cv2.FILLED)
                font = cv2.FONT_HERSHEY_DUPLEX
                cv2.putText(frame, name, (left + 6, bottom - 6), font, 1.0, (255, 255, 255), 1)

            ret, buffer = cv2.imencode('.jpg', frame)
            frame = buffer.tobytes()
            yield (b'--frame\r\n'
                   b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')
def time_in_range(start, end, x,i):
    """Return true if x is in the range [start, end]"""
    if start <= end:
        return start <= x <= end
    else:
        return start <= x or x <= end

def train(regno):
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="buspass",
    )
    cursor = connection.cursor()
    sql1 = "SELECT Photo,RegNo FROM students WHERE regno='" + regno + "'"
    cursor.execute(sql1)
    data2 = cursor.fetchall()
    if data2[0][0] != None:

        file_like2 = io.BytesIO(data2[0][0])
        for r in data2:
            name = r[1]

        img1 = Image.open(file_like2)
        img1.save("./ImageAttandance/" + name + ".png")
        cursor.close()
        connection.close()


def shutDown():
    camera.release()


@app.route('/end')
def end():
    shutDown()
    return render_template('done.html')


@app.route('/')
def index():
    camera_module= cv2.VideoCapture(0)
    if camera_module.isOpened():
        return render_template('index.html')
    else:
        return render_template('Cam-err.html')


@app.route('/video')
def video():
    return Response(gen_frames(), mimetype='multipart/x-mixed-replace; boundary=frame')

def restart_program():
    print("Restart Initiated")
    return render_template('training.html')
    os.system("python Attandace.py")

@app.route('/trainer', methods=['POST'])
def trainer():
    regno = request.form['regno']
    train(regno)
    restart_program()
    return render_template('training.html')

if __name__ == '__main__':
    app.run(debug=True)
