import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts
import CustomClass 1.0
import Qt5Compat.GraphicalEffects
import QtQuick.Effects
import QtQuick.Controls



Item {
    property var send // use this for changing pages. example: send(pagename.qml,Screen.width, Screen.height)
    
    anchors.fill: parent

    

    

    ColumnLayout { // Holds entire UI, topbar, center_ui, topbar
        width: parent.width
        height: parent.height
        spacing: 0

        Rectangle { // topbar area
            id: main_topbar

            Layout.fillWidth: true
            Layout.preferredHeight: Screen.height * 0.055
            color: "#000000"
        
            opacity: 1
            }

        Rectangle { // center_ui area
            id: main_center_ui

            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"
    
            opacity: 1
            
            
            RowLayout {
                width: parent.width
                height: parent.height
            
                Rectangle { // Left Panel
                    Layout.margins: 4
                    Layout.leftMargin: 8
                    Layout.rightMargin: 3
                    Layout.preferredWidth: Screen.width * 0.22
                    Layout.fillHeight: true
                    radius: 8
                    opacity: 1
                    color: "#101010"
                }

                Rectangle { // Middle Panel
                    id: main_middle_panel
                    Layout.topMargin: 4
                    Layout.bottomMargin: 4
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    radius: 8
                    color: "#101010"
                    clip: true

                    property color gradientColor: "#FF0000"

                    Flickable {
                        id: flick1
                        anchors.fill: parent
                        clip: true

                        

                        boundsBehavior: Flickable.StopAtBounds
                        boundsMovement: Flickable.StopAtBounds

                        flickDeceleration: 1800
                        maximumFlickVelocity: 12000

                        pixelAligned: true

                        contentWidth: width
                        contentHeight: content.implicitHeight

                        Column {
                            id: content
                            width: parent.width
                            spacing: 2

                            Rectangle {
                                width: parent.width
                                height: Screen.height * 0.52
                                radius: 8

                                gradient: Gradient {
                                    GradientStop { position: 0.0; color: main_middle_panel.gradientColor }
                                    GradientStop { position: 0.42; color: "#101010" }
                                }
                            }

                            Rectangle {
                                width: parent.width
                                height: Screen.height * 0.33
                                color: "#737373"
                            }

                            Rectangle {
                                width: parent.width
                                height: Screen.height * 0.33
                                color: "#737373"
                            }

                            Rectangle {
                                width: parent.width
                                height: Screen.height * 0.33
                                color: "#737373"
                            }
                        }
                    }
                    
                    Rectangle {
                        width: parent.width
                        height: parent.height * 0.072
                        color: main_middle_panel.gradientColor
                    }
                    
                }
                

                Rectangle { // Right Panel
                    Layout.margins: 4
                    Layout.leftMargin: 3
                    Layout.rightMargin: 8
                    Layout.preferredWidth: Screen.width * 0.22
                    Layout.fillHeight: true
                    radius: 8
                    opacity: 1
                    color: "#101010"
                }
            
            }
        }



        Rectangle { // bottombar area
            id: main_bottombar

            Layout.fillWidth: true
            Layout.preferredHeight: Screen.height * 0.08
            color: "#000000"
        
            opacity: 1
        }
    
    }






}