import QtQuick 2.9
import QtQuick.Window 2.2
import CustomClass 1.0

Window {
    id: rootid
    visible: true
    width: 600
    height: 350
    color: "black"

    title: "Offbeat"

    flags: Qt.Window | Qt.FramelessWindowHint

    
    
    
    
    Loader {
        id: mainloader
        anchors.fill: parent
        source: "BootPage.qml"

        onLoaded: {
            item.send = function(message,numx,numy) {
                mainloader.source = message
                
                rootid.width = numx
                rootid.height = numy
                
                rootid.x = (Screen.width - rootid.width) / 2
                rootid.y = (Screen.height - rootid.height) / 2
            }
        }
    }
    
}
