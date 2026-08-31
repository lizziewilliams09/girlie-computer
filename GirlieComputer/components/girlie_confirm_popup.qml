import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

// Import reusable QML types from the parent GirlieComputer folder
import ".."

GirliePopup {
    id: root

    property string titleText: "♡ CONFIRM ♡"
    property string messageText: "Are you sure?"

    signal confirmed()

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 25

        Text {
            text: root.titleText

            font.pixelSize: Theme.popupTitleSize
            font.bold: true
            color: Theme.primary

            Layout.alignment: Qt.AlignHCenter
        }

        Text {
            text: root.messageText

            color: Theme.primaryDark
            font.pixelSize: Theme.bodySize

            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap

            Layout.preferredWidth: 300
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 15

            GirlieButton {
                text: "CANCEL"

                Layout.preferredWidth: 120
                Layout.preferredHeight: 45

                normalColor: Theme.primarySoft
                hoverColor: Theme.primaryHover
                borderColor: Theme.primary
                textColor: Theme.primaryDark

                onClicked: root.close()
            }

            GirlieButton {
                text: "CONFIRM"

                Layout.preferredWidth: 120
                Layout.preferredHeight: 45

                onClicked: {
                    root.confirmed()
                    root.close()
                }
            }
        }
    }
}