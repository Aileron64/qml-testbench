import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

import "../Components"

SM_Page
{
  property int labelWidth: 150
  property int fieldWidth: 650

  nextEnabled: false
  
  Connections
  {
    target: app

    function onUpdateWeight(weight)
    {
      weightText.text = weight.toString()
    }
  }

  SM_Frame
  {
    ColumnLayout
    {
      anchors.centerIn: parent
      spacing: 16

      SM_Text 
      { 
        text: "PLACE THE PLANT ON THE SCALE TO THE SIDE OF THE DEVICE AND CLICK WEIGH" 
      }

      RowLayout
      {
        SM_Text
        {
          text: "Plant"
          Layout.preferredWidth: labelWidth
        }

        SM_TextField
        {
            id: plantField
            text: "Potato"
            Layout.preferredWidth: fieldWidth
            Layout.fillWidth: false
        }

        SM_ErrorText
        {
          id: plantError
          text: "Please enter the plant"
        }
      }

      SM_Button
      {
        text: "Weigh"
        Layout.preferredWidth: 200
        onClicked: app.weighPlant()
      }

      RowLayout
      {
        SM_Text
        {
          text: "Grams:"
          Layout.preferredWidth: labelWidth
        }

        SM_Text
        {
          id: weightText
          color: "#333333"
          font.pointSize: 12
        }
      }
    } 
  }
}
