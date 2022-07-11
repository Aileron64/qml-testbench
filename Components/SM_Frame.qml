import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Frame
{
    Layout.fillWidth: true
    Layout.fillHeight: true
    padding: 30

    background: Rectangle
    {
        id: background
        color: "#e6e3e3"
        radius: 10
    }

    DropShadow
    {
        anchors.fill: background
        source: background
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 17
        color: "black"
    }
}
