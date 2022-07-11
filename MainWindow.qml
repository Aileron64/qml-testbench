import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.12

import "Components"
import "Pages"
import "Popups"

ApplicationWindow
{
    id: mainWindow
    width: 1600
    height: 900
    visibility: "FullScreen"

    property var currentPage: homePage
    property bool isLoggedIn: true

    Component.onCompleted: currentPage.visible = true

    Image
    {
        id: background
        width: parent.width
        height: parent.height
        source: "./Images/background.jpg"
    }

    Frame
    {
        id: mainPanel
        visible: isLoggedIn
        width: parent.width * 0.9
        height: parent.height * 0.8
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.1
        anchors.horizontalCenter: parent.horizontalCenter

        background: SM_PanelBackground { }

        HomePage { id: homePage }
        ScanPage { id: scanPage }
        WeighPage { id: weighPage }
        TestPage { id: testPage }
        
        RowLayout
        {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.03
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.85
            height: parent.height * 0.1

            RowLayout
            {
                Layout.fillHeight: true
                Layout.fillWidth: false
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 420
                spacing: 20

                Button
                {
                    text: "Back"
                    Layout.alignment: Qt.AlignLeft
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    enabled: currentPage.prevEnabled
                    onClicked: currentPage.onPrev()
                }

                Button
                {
                    text: "Next"
                    Layout.alignment: Qt.AlignRight
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    enabled: currentPage.nextEnabled
                    onClicked: currentPage.onNext()
                }
            }

            Button
            {
                text: "Chatbot"
                Layout.alignment: Qt.AlignRight
                Layout.fillHeight: true
                Layout.preferredWidth: 200
                onClicked: chatboxDrawer.visible = true
            }
        }
    }

    Rectangle
    {
        id: popupBackdrop
        visible: false
        anchors.fill: parent
        color: "#4f4f4f"
        opacity: 1
    }

    LoginPage
    {
        id: popupLogin
        visible: !isLoggedIn
    }

    Item
    {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.margins: 10

        ToolTip
        {
            id: errorDisplay
            timeout: 3000
            font.pointSize: 18

            background: Rectangle 
            {
                color: "#9c0000"
                radius: 10
            }
        }
    }

    ChatBox { id: chatboxDrawer }

    Button
    {
        text: "Exit"
        visible: true
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 20

        onClicked: Qt.quit()
    }
}
