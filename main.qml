import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import org.kde.kirigami 2.4 as Kirigami
import QtQuick.Window 2.2
import Mycroft 1.0 as Mycroft

import "panel"

Kirigami.AbstractApplicationWindow {
    id: root
    visible: true

    minimumHeight : deviceHeight || undefined
    maximumHeight : deviceHeight || undefined
    minimumWidth : deviceWidth || undefined
    maximumWidth : deviceWidth || undefined
    x: deviceWidth ? Screen.desktopAvailableHeight - width : undefined
    y: deviceHeight ? Screen.desktopAvailableHeight - height : undefined

    color: "grey"
    Kirigami.Theme.colorSet: Kirigami.Theme.Complementary

    SlidingPanel {
        //to change the color of the entire panel, uncomment this
       // Kirigami.Theme.colorSet: Kirigami.Theme.Window
        width: root.width
    }
    Image {
        source: "background.png"
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent
            Mycroft.StackSkillView {
                id: mainView
                initialItem: Idler {}
                Layout.fillHeight: true
                Layout.fillWidth: true

                Mycroft.StatusIndicator {
                    id: si
                    visible: true
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        bottom: parent.bottom
                        bottomMargin: Kirigami.Units.largeSpacing
                    }
                    z: 999
                }
            }
            TextField {
                Layout.fillWidth: true
                id: qinput
                onAccepted: {
                    Mycroft.MycroftController.sendText(qinput.text)
                }
                visible: !hideTextInput
            }
        }
    }
}


