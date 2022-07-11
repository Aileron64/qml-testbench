import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

import "../Components"

SM_Popup
{
    nextPage: weighPage
    prevPage: page3

    SM_Frame
    {
        SM_Text { text: "Annotate Current assets ?" }


        Column
        {
            anchors.centerIn: parent
            spacing: 16

            Row
            {
                spacing: 16
                anchors.horizontalCenter: parent.horizontalCenter
                Button { text: "Yes"; onClicked: console.log("yes"); palette{button: "green"}}
                Button { text: "Later"; onClicked: console.log("later"); palette{button: "green"}}
            }
        }
    }
}