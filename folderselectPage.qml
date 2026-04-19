import QtQuick 2.9
import CustomClass 1.0
import Qt5Compat.GraphicalEffects


Item {
    property var send // use this for changing pages. example: send(pagename.qml,Screen.width, Screen.height)
    anchors.fill: parent

    Rectangle { // Main Rectangle at start
        id: musicfolder_invisrect
        width: parent.width * 0.18
        height: parent.height * 0.15
        anchors.centerIn: parent

        color: "transparent"   // invisible holder

        Rectangle {
            id: musicfolderrect
            width: parent.width
            height: parent.height
            color: "#80050505"
            radius: 24

            border.color: "#430d0c0d"
            border.width: 3

            anchors.top: parent.top
            anchors.topMargin: 30
            opacity: 0
            
            Text {
                id: musicfolderrect_text
                text: {
                    if (Backend.getValueExistingMusicFolder() === 1) {
                        return "Open MediaVault"
                    } else {
                        return "Create Media Vault"
                    }
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "#393940"
                font.pointSize: 22
                font.bold: true
                font.family: "Inter" // or "Segoe UI"

                anchors.top: parent.top
                anchors.margins: 24

                width: parent.width
                height: parent.height * 0.2
            }

            DropShadow {
                anchors.fill: musicfolderrect_text
                source: musicfolderrect_text

                horizontalOffset: 0
                verticalOffset: 2
                radius: 12
                samples: 16
                color: "#111112"
            }

            Rectangle {
                id: mainrect_rectsHolder
                color: "#070708"
                radius: 100

                width: parent.width * 0.9
                height: parent.height * 0.25

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.margins: 16

                Rectangle {
                    id: mainrect_inforect
                    color: "#070708" // when on the color is #8b8496
                    radius: 100

                    width: parent.width * 0.52
                    height: parent.height

                    anchors.left: parent.left
                    
                    Text {
                        id: mainrect_inforect_text
                        text: "Music Info"

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                        color: "#707070"
                        font.pointSize: 14
                        font.bold: true
                        font.family: "Inter" // or "Segoe UI"
                        opacity: 1
                        

                        width: parent.width
                        height: parent.height
                    }

                }
                Rectangle {
                    id: mainrect_start_or_create_rect
                    color: "#070708" // when on the color is #8b8496
                    radius: 100

                    width: parent.width * 0.52
                    height: parent.height

                    anchors.right: parent.right
                    
                    Text {
                        id: mainrect_start_or_create_rect_text
                        text: Backend.getValueExistingMusicFolder() === 1
                            ? "Open Vault" // if folder exists
                            : "Create Vault" // if it doesnt

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                        color: "#707070"
                        font.pointSize: 14
                        font.bold: true
                        font.family: "Inter" // or "Segoe UI"
                        opacity: 1
                        

                        width: parent.width
                        height: parent.height
                    }

                }

                // Button Detection
                MouseArea {
                    width: parent.width * 0.5
                    height: parent.height
                    anchors.left: parent.left
                    hoverEnabled: true
                    onEntered: {
                        mainrect_hoverOut1.stop()
                        mainrect_hoverIn1.start()
                    }

                    onExited: {
                        mainrect_hoverIn1.stop()
                        mainrect_hoverOut1.start()
                    }
                    onClicked: info_page_fadein_anim.start()
                }
                MouseArea {
                    width: parent.width * 0.5
                    height: parent.height
                    anchors.right: parent.right
                    hoverEnabled: true
                    onEntered: {
                        mainrect_hoverOut2.stop()
                        mainrect_hoverIn2.start()
                    }

                    onExited: {
                        mainrect_hoverIn2.stop()
                        mainrect_hoverOut2.start()
                    }
                    // onClicked: 
                }


                // Animations
                ParallelAnimation {
                    id: mainrect_hoverIn1

                    ColorAnimation { target: mainrect_inforect; property: "color"; to: "#8b8496"; duration: 100 }
                    ColorAnimation { target: mainrect_inforect_text; property: "color"; to: "#100f12"; duration: 100 }
                    NumberAnimation { target: mainrect_inforect; property: "z"; to: 2; duration: 0 }
                    NumberAnimation { target: mainrect_start_or_create_rect; property: "z"; to: 1; duration: 0 }
                }
                ParallelAnimation {
                    id: mainrect_hoverOut1

                    ColorAnimation { target: mainrect_inforect; property: "color"; to: "#070708"; duration: 0 }
                    ColorAnimation { target: mainrect_inforect_text; property: "color"; to: "#707070"; duration: 0 }
                }
                ParallelAnimation {
                    id: mainrect_hoverIn2

                    ColorAnimation { target: mainrect_start_or_create_rect; property: "color"; to: "#8b8496"; duration: 100 }
                    ColorAnimation { target: mainrect_start_or_create_rect_text; property: "color"; to: "#100f12"; duration: 100 }
                    NumberAnimation { target: mainrect_inforect; property: "z"; to: 1; duration: 0 }
                    NumberAnimation { target: mainrect_start_or_create_rect; property: "z"; to: 2; duration: 0 }
                }
                ParallelAnimation {
                    id: mainrect_hoverOut2

                    ColorAnimation { target: mainrect_start_or_create_rect; property: "color"; to: "#070708"; duration: 0 }
                    ColorAnimation { target: mainrect_start_or_create_rect_text; property: "color"; to: "#707070"; duration: 0 }
                }

                
            }
            



        } 
    }


    Rectangle { // Info Page Rectangle
        id: infopage_invisrect
        width: parent.width * 0.35
        height: parent.height * 0.45
        anchors.centerIn: parent
        opacity: 0

        color: "transparent"   // invisible holder

        Rectangle {
            id: infopage_mainrect
            width: parent.width
            height: parent.height
            color: "#80050505"
            radius: 24

            border.color: "#430d0c0d"
            border.width: 3

            anchors.top: parent.top
            anchors.topMargin: 30
            opacity: 1
            
            Text {
                text: {
                    if (Backend.getValueExistingMusicFolder() === 1) {
                        return "No Media Folder Exists"
                    } else {
                        return "Create Media Vault"// change to get name out of a function that checks inside the folder config file
                    }
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "#393940"
                font.pointSize: 32
                font.bold: true
                font.family: "Inter" // or "Segoe UI"

                anchors.top: parent.top
                anchors.margins: 24

                width: parent.width
                height: parent.height * 0.15
            }

            

            
            



        }
    }



    SequentialAnimation { // animate MusicFolderSelector Rectangle first fadein
        id: musicfolderrect_anim1

        PauseAnimation { duration: 800 }

        ParallelAnimation {
            NumberAnimation {
                target: musicfolderrect
                property: "opacity"
                from: 0
                to: 1
                duration: 500
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                target: musicfolderrect
                property: "anchors.topMargin"
                from: 30
                to: 0
                duration: 250
                
            }
        }
    }
    
    
    SequentialAnimation { // animate Info Page open
        id: info_page_fadein_anim

        // PauseAnimation { duration: 800 }

        NumberAnimation {
            target: musicfolder_invisrect
            property: "opacity"
            to: 0
            duration: 200
            easing.type: Easing.OutCubic
        }

        NumberAnimation {
            target: infopage_invisrect
            property: "opacity"
            to: 1
            duration: 200
            easing.type: Easing.OutCubic
        }
        
    }
    

    
        

    

    
    





    
    
    
    

    





    // On Page loaded function
    Component.onCompleted: {
        musicfolderrect_anim1.start()
    }
}