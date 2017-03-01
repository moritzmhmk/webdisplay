import QtQuick 2.0
import QtQuick.Window 2.0
import QtWebKit 3.0

Window {
    width: 800
    height: 600
    color: "black"
    visible: true
    WebView {
        id: webview
        url: "http://google.de"
        anchors.fill: parent              
        MouseArea {         
            id: mousearea                    
            anchors.fill: parent             
            hoverEnabled: true               
            acceptedButtons: Qt.RightButton
            onClicked: {                   
                if (mouse.button == Qt.RightButton)
                   webview.reload()                
            }                                      
            onPositionChanged: {                   
                mouseTimer.restart()               
                cursorShape = Qt.ArrowCursor       
            }                                      
            Timer {                                
                id: mouseTimer                     
                interval: 7000; running: true; repeat: false
                onTriggered: mousearea.cursorShape = Qt.BlankCursor
            }                                                      
        }                                                          
    }                                                              
} 
