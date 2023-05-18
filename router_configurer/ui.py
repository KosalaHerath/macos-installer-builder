import PySimpleGUI as sg

layout = [  [sg.Text('Username'), sg.Input(key='-USERNAME-')],
            [sg.Text('Password'), sg.Input(key='-PASSWORD-')],
            [sg.Button('Ok', key='-OK-'), sg.Cancel()],
            [sg.Button('Submit', visible=False, bind_return_key=True)]
        ]