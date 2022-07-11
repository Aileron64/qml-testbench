import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

import "../Components"

Frame
{
    width: parent.width * 0.4
    height: parent.height * 0.4
    anchors.centerIn: parent
    background: SM_PanelBackground { }

    ColumnLayout
    {
        width: parent.width * 0.8
        height: parent.height * 0.8
        anchors.centerIn: parent
        spacing: 16

        ColumnLayout
        {
            SM_TextField
            {
                id: usernameField
                focus: true
                text: "cubic_farms"
                placeholderText: qsTr("Enter Username")

                background: Rectangle
                {
                    color: "#e6e3e3"
                    radius: 3
                }
            }

            SM_Text
            {
                color: "white"
                font.pointSize: 8
                text: "  Username"
            }
        }

        ColumnLayout
        {
            SM_TextField
            {
                id: passwordField
                focus: true
                text: "cubicfarms@123"
                placeholderText: qsTr("Enter Password")
                echoMode: TextInput.Password

                background: Rectangle
                {
                    color: "#e6e3e3"
                    radius: 3
                }
            }

            SM_Text
            {
                color: "white"
                font.pointSize: 8
                text: "  Password"
            }
        }

        RowLayout
        {
            spacing: 16
            Layout.alignment: Qt.AlignHCenter

            Button
            {
                Layout.preferredWidth: 300
                text: "Login"
                onClicked: app.login(usernameField.text, passwordField.text)
            }
        }
    }
}
