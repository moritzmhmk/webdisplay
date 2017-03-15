import QtQuick 2.0
import QtQuick.Window 2.0
import QtWebKit 3.0

Window {
  width: 800
  height: 600
  color: "black"
  visible: true
  Rectangle {
    anchors {
      bottom: parent.bottom
      left: parent.left
      right: parent.right
      leftMargin: 5
      rightMargin: 5
      bottomMargin: 5
    }
    Rectangle {
      anchors {
        top: parent.top
        bottom: parent.bottom
        left: parent.left
      }
      width: parent.width / 100 * Math.max(5, webview.loadProgress)
      color: "steelblue"
      radius: parent.radius
    }
    height: 20
    radius: 5
    color: "lightsteelblue"
    border {
      width: 1
      color: "darkslategrey"
    }
    opacity: 0.8
    z: webview.z + 1
    visible: webview.loading
  }
  WebView {
    id: webview
    url: "http://google.de"
    anchors.fill: parent
    onLoadingChanged: {
      if (loadRequest.status == WebView.LoadFailedStatus)
      reload()
    }
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
