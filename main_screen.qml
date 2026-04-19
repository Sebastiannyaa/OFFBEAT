import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts
import CustomClass 1.0





Item {
    property var send // use this for changing pages. example: send(pagename.qml,Screen.width, Screen.height)
    
    anchors.fill: parent

    

    

    ColumnLayout {
        width: parent.width
        height: parent.height


        Rectangle {
            id: main_topbar

            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.04
            color: "#07090C"
        
            opacity: 1

            
        }

        Rectangle {
            id: main_center_ui

            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.88
            color: "#07090C"
    
            opacity: 1
    
        }
        Rectangle {
            id: main_bottombar

            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.08
            color: "#07090C"
        
            opacity: 1


        }
    
    }






}