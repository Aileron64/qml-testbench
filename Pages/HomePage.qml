import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

import "../Components"

SM_Page
{
    property int labelWidth: 150
    property int fieldWidth: 650

    prevEnabled: false

    function onNext()
    {
        var error = false
        var errorMsg = ""
        var selectedMode
        var selectedFunction

        if(produceField.text.trim() === "")
        {
            error = true
            produceError.visible = true
        }

        if(datField.text.trim() === "")
        {
            error = true
            datError.visible = true
        }
        
        if(trialField.text.trim() === "")
        {
            error = true
            trialError.visible = true
        }

        if(trayField.text.trim() === "")
        {
            error = true
            trayError.visible = true
        }

        if(singlePlantRB.checked)
            selectedMode = "SINGLE_PLANT"
        else if(fullTrayRB.checked)
            selectedMode = "FULL_TRAY"
        else
        {
            error = true
            modeError.visible = true
        }

        if(collectionRB.checked)
            selectedFunction = "COLLECTION"
        else if(analysisRB.checked)
            selectedFunction = "ANALYSIS"
        else
        {
            error = true
            functionError.visible = true
        }

        if(error)
            app.displayError("Missing Required Values")
        else
        {
            if(selectedMode === "SINGLE_PLANT")
                currentPage = weighPage
            else
                currentPage = scanPage

            app.setMode(selectedMode)
            app.setFunction(selectedFunction)

            visible = false
            currentPage.prevPage = homePage
            currentPage.visible = true
        }
    }

    function onPrev() 
    {
        Qt.quit()
    }

    RowLayout
    {
        spacing: 20

        SM_Frame
        {
            ColumnLayout
            {
                anchors.fill: parent

                RowLayout
                {
                    SM_Text
                    {
                        text: "Grader:"
                        Layout.preferredWidth: labelWidth
                    }

                    SM_Text
                    {
                        id: usernameText
                        color: "#333333"
                        font.pointSize: 12
                    }
                }

                RowLayout
                {
                    SM_Text
                    {
                        text: "Produce:"
                        Layout.preferredWidth: labelWidth
                    }

                    SM_TextField
                    {
                        id: produceField
                        text: "Potatoe"
                        placeholderText: "Enter Produce Name"
                        Layout.preferredWidth: fieldWidth
                        Layout.fillWidth: false
                    }
                    
                    SM_ErrorText
                    {
                        id: produceError
                        text: "Please enter produce type"
                    }
                }

                RowLayout
                {
                    SM_Text
                    {
                        text: "D.A.T.:"
                        Layout.preferredWidth: labelWidth
                    }

                    SM_TextField
                    {
                        id: datField
                        text: "1"
                        Layout.preferredWidth: fieldWidth
                        Layout.fillWidth: false
                    }

                    SM_ErrorText
                    {
                        id: datError
                        text: "Please enter the D.A.T"
                    }
                }

                RowLayout
                {
                    SM_Text
                    {
                        text: "Trial ID:"
                        Layout.preferredWidth: labelWidth
                    }

                    SM_TextField
                    {
                        id: trialField
                        text: "1"
                        Layout.preferredWidth: fieldWidth
                        Layout.fillWidth: false
                    }
                                        
                    SM_ErrorText
                    {
                        id: trialError
                        text: "Please enter the trial ID"
                    }
                }

                RowLayout
                {
                    SM_Text
                    {
                        text: "Tray ID:"
                        Layout.preferredWidth: labelWidth
                    }

                    SM_TextField
                    {
                        id: trayField
                        text: "1"
                        Layout.preferredWidth: fieldWidth
                        Layout.fillWidth: false
                    }

                    SM_ErrorText
                    {
                        id: trayError
                        text: "Please enter the tray ID"
                    }
                }
            }
        }
    }

    RowLayout
    {
        spacing: 20
        Layout.fillWidth: true
        Layout.fillHeight: true

        SM_Frame
        {
            ColumnLayout
            {
                anchors.fill: parent

                SM_Text {text: "Select Mode"}

                Column
                {
                    Layout.alignment: Qt.AlignTop
                    SM_RadioButton {id: singlePlantRB; text: "Single Plant"}
                    SM_RadioButton {id: fullTrayRB; text: "Full Tray"}

                    SM_ErrorText
                    {
                        id: modeError
                        text: "Please select a mode"
                    }
                }
            }
        }

        SM_Frame
        {
            ColumnLayout
            {
                anchors.fill: parent

                SM_Text {text: "Select Function"}

                Column
                {
                    Layout.alignment: Qt.AlignTop
                    SM_RadioButton {id: collectionRB; text: "Collection"}
                    SM_RadioButton {id: analysisRB; text: "Analysis"}

                    SM_ErrorText
                    {
                        id: functionError
                        text: "Please select a function"
                    }
                }
            }
        }
    }

    Component
    {
        id: radioButtonLayout

        SM_Frame
        {
            ColumnLayout
            {
                
            }
        }
    }
}
