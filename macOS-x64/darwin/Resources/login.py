#!/usr/bin/python3 

import PySimpleGUI as sg

def verify_password(user, password):
    return True

print("I'm alive")
layout = [  [sg.Text('Username'), sg.Input(key='-USERNAME-')],
            [sg.Text('Password'), sg.Input(key='-PASSWORD-')],
            [sg.Ok(), sg.Cancel()]]

window = sg.Window('fEMR Login', layout)

while True:
    event, values = window.read()
    if event == sg.WIN_CLOSED or event == 'Cancel':
        break

user = window["-USERNAME-"]
password =  window["-PASSWORD-"]

verfiy_password(user, password)
window.close()