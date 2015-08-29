import QtQuick 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3

Item {
    property Component header: Item {}
    property Component footer: Item {}
    property Component bodyA: Item {}
    property Component bodyB: Item {}

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // header
        Loader {
            Layout.fillWidth: true
            Layout.fillHeight: false
            Layout.preferredHeight: item.height
            sourceComponent: header
        }

        // splitted body
        SplitView {
            id: view
            Layout.fillWidth: true
            Layout.fillHeight: true
            orientation: Qt.Horizontal
            handleDelegate: Rectangle {
                width: 2
                height: 2
                color: _style.window.color.xdarker
            }
            Loader {
                width: parent.width*0.26
                sourceComponent: bodyA
            }
            Loader {
                Layout.minimumWidth: 50
                Layout.fillWidth: true
                sourceComponent: bodyB
            }
        }

        // footer
        Loader {
            Layout.fillWidth: true
            Layout.fillHeight: false
            Layout.preferredHeight: item.height
            sourceComponent: footer
        }
    }

}
