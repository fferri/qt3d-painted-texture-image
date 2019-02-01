import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Scene3D 2.0

Window {
    id: root
    width: 800
    height: 600
    visible: true
    title: "Test"
    color: "#f9f9f9"

    Scene3D {
        id: scene3d
        anchors.fill: parent
        focus: true

        anchors.margins: 10
        aspects: ["input", "logic"]
        cameraAspectRatioMode: Scene3D.AutomaticAspectRatio

        MyScene {
        }
    }
}
