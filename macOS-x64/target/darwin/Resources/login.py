#!/usr/bin/python3 

import PySimpleGUI as sg

def verify_password(user, password):
    if (user == "admin" and password == "admin"):
        return True
    else:
        print("incorrect login")

layout = [  [sg.Text('Username'), sg.Input(key='-USERNAME-')],
            [sg.Text('Password'), sg.Input(key='-PASSWORD-')],
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

window.close()