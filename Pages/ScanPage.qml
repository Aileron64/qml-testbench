import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

import "../Components"

SM_Page
{
    nextEnabled: false

    Connections
    {
        target: app

        function onDisplayScanProgress(current, total)
        {
            scanProgressText.text = 
                "Scanning...(" + current + "/" + total + ")"
        }
    }

    RowLayout
    {
        spacing: 20

        ColumnLayout
        {
            Layout.fillWidth: true

            SM_Button
            {
                text: "Scan"
                onClicked: app.scanTray()
            }

            SM_Text
            {
                id: scanProgressText
                text: "..."
                color: "white"
                font.pointSize: 8
            }

            ProgressBar
            {
                Layout.preferredWidth: 600
            }
        }

        SM_Frame
        {
            Layout.fillWidth: true

            ListView
            {   
                anchors.fill: parent
                anchors.margins: 25

                model: listModel

                delegate: SM_Text
                {
                    anchors.leftMargin: 50
                    font.pointSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    text: name
                }
            }
        }
    }

    ListModel
    {
        id: listModel
    }
}
