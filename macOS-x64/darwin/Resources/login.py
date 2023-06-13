#!/usr/bin/python3 

import PySimpleGUI as sg
import requests

def verify_password(user, password):
    r = requests.put("https://vgyc6fujod.execute-api.us-east-1.amazonaws.com/prod/login", json={"email": user, "password": password})
    if (r.json()['accepted'] == "True"):
        return True
    else:
        print("incorrect login")
        return False

layout = [  [sg.Text('Username'), sg.Input(key='-USERNAME-')],
            [sg.Text('Password'), sg.Input(key='-PASSWORD-', password_char='*')],
            [sg.Text(''), sg.Text(size=(50,1), key='-mytext-', text_color='red')],
            [sg.Button('Ok', key='-OK-'), sg.Cancel()],
            [sg.Button('Submit', visible=False, bind_return_key=True)]
        ]

window = sg.Window('fEMR Login', layout)

while True:
    event, values = window.read()

    if event == sg.WIN_CLOSED or event == 'Cancel':
        print("closed")
        break
    elif event == 'Submit' or event == '-OK-':
        user = window['-USERNAME-'].get()
        password = window['-PASSWORD-'].get()

        if(verify_password(user, password)):
            break
        else:
            window['-mytext-'].update("Invalid credentials")

window.close()