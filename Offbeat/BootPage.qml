import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts
import CustomClass 1.0


Item {
    property var send // use this for changing pages. example: send(pagename.qml,Screen.width, Screen.height)
    
    anchors.fill: parent

    Text { //Title text
        id: boottitlelabel

        text: "OFFBEAT"
        color: "white"
        font.pointSize: 26
        font.bold: true

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 8
        anchors.leftMargin: 20

        opacity: 0
    }

    Text { // Version text
        id: bootversionlabel

        text: "v1"
        color: "white"
        font.pointSize: 18
        font.bold: true

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 12
        anchors.leftMargin: 20

        opacity: 0
    }

    

    Image { // Image with buttons
        id: bootimage
        width: 400
        height: 350
        opacity: 0

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        source: "images/boot_image.png"
        fillMode: Image.PreserveAspectCrop
        layer.enabled: true
        layer.smooth: true

        
        

        MouseArea { // Uses image hover to show buttons
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                rect1.opacity = 0.95
                rect2.opacity = 0.95
            }

            onExited: {
                rect1.opacity = 0
                rect2.opacity = 0
            }
        }
    } 

    RowLayout { // Row layout with buttons
        id: buttonsRowLayout1
        anchors.right: parent.right
        anchors.top: parent.top
        
        anchors.margins: 8
        spacing: 6
        opacity: 0

        Rectangle { // Start button
            id: rect1
            width: 100
            height: 40
            color: "#07090C"
            radius: 100
            opacity: 0
            clip: true
                
            Behavior on opacity {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.OutCubic
                }
            }
                
            Text {
                id: rect1text
                text: "Launch"
                color: "white"
                anchors.fill: parent
                font.pixelSize: 14
                font.bold: true
                font.family: "Inter"   // or "Segoe UI"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // Switch Ui, Ignore underlined false error
                        send("main_screen.qml",Screen.width, Screen.height)
                    }
                }
            }
        }
            
        Rectangle { // Close button
            id: rect2
            width: 40
            height: 40
            color: "#07090C"
            radius: 100
            opacity: 0
            clip: true

            Behavior on opacity {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.OutCubic
                }
            }
                
            Text {
                id: rect2text
                text: "X"
                color: "white"
                anchors.fill: parent
                font.pixelSize: 14
                font.bold: true
                font.family: "Inter"   // or "Segoe UI"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // Close ui
                        Backend.close_app_task()
                    }
                }
            }
        }
        
    }
        

    

    
    





    
    
    
    

    SequentialAnimation { // Start animations
        id: textanimation

        PauseAnimation { duration: 800 }
        
        
        NumberAnimation { // animate title text
            target: boottitlelabel
            property: "opacity"
            from: 0
            to: 1
            duration: 200
            easing.type: Easing.OutQuad
        }
        NumberAnimation { // animate version text
            target: bootversionlabel
            property: "opacity"
            from: 0
            to: 1
            duration: 200
            easing.type: Easing.OutQuad
        }
        
        
        PauseAnimation { duration: 50 }
        
        ParallelAnimation { // animate image and buttons together
            NumberAnimation {
                target: bootimage
                property: "opacity"
                from: 0
                to: 0.5
                duration: 200
                easing.type: Easing.InQuad
            }
            NumberAnimation {
                target: buttonsRowLayout1
                property: "opacity"
                from: 0
                to: 1
                duration: 200
                easing.type: Easing.InQuad
            }

        }
        
        
    }






    Component.onCompleted: {
        textanimation.start()
        if(Backend.getValueExistingMusicFolder() === 1) {
            console.log("Folder exists")
        } else {
            Backend.createMusicVaultFolder()
        }
    }





}