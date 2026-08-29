import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Popup {
    id: popup

    anchors.centerIn: Overlay.overlay

    width: 450
    height: 350

    modal: true
    focus: true

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    background: Rectangle {
        color: "#fff3f8"
        border.color: "#d95f96"
        border.width: 3
        radius: 18
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 25

        Text {
            text: "♡ ADD A BOOK ♡"

            font.pixelSize: 28
            font.bold: true
            color: "#d95f96"

            Layout.alignment: Qt.AlignHCenter
        }

        GridLayout {
            columns: 2
            columnSpacing: 15
            rowSpacing: 12

            Text {
                text: "Title:"
                color: "#b86b8c"
                font.pixelSize: 16
            }

            TextField {
                id: titleInput
                placeholderText: "Book title..."
                Layout.preferredWidth: 250

                color: "#b94f82"
                placeholderTextColor: "#c98ba6"
                font.pixelSize: 16

                background: Rectangle {
                    color: "#fffafd"
                    border.color: titleInput.activeFocus ? "#d95f96" : "#e8a9c4"
                    border.width: 2
                    radius: 8
                }
            }

            Text {
                text: "Author:"
                color: "#b86b8c"
                font.pixelSize: 16
            }

            TextField {
                id: authorInput
                placeholderText: "Author..."
                Layout.preferredWidth: 250

                color: "#b94f82"
                placeholderTextColor: "#c98ba6"
                font.pixelSize: 16

                background: Rectangle {
                    color: "#fffafd"
                    border.color: authorInput.activeFocus ? "#d95f96" : "#e8a9c4"
                    border.width: 2
                    radius: 8
                }
            }

            Text {
                text: "Date read:"
                color: "#b86b8c"
                font.pixelSize: 16
            }

            TextField {
                id: dateReadInput
                placeholderText: "YYYY-MM-DD"
                Layout.preferredWidth: 250

                color: "#b94f82"
                placeholderTextColor: "#c98ba6"
                font.pixelSize: 16

                background: Rectangle {
                    color: "#fffafd"
                    border.color: dateReadInput.activeFocus ? "#d95f96" : "#e8a9c4"
                    border.width: 2
                    radius: 8
                }
            }

            Text {
                text: "Rating:"
                color: "#b86b8c"
                font.pixelSize: 16
            }

            TextField {
                id: ratingInput
                placeholderText: "1–10"
                Layout.preferredWidth: 250

                color: "#b94f82"
                placeholderTextColor: "#c98ba6"
                font.pixelSize: 16

                background: Rectangle {
                    color: "#fffafd"
                    border.color: ratingInput.activeFocus ? "#d95f96" : "#e8a9c4"
                    border.width: 2
                    radius: 8
                }
            }
        }

        Button {
            id: closeButton

            text: "CLOSE"

            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 140
            Layout.preferredHeight: 45

            onClicked: popup.close()

            background: Rectangle {
                radius: 10
                color: closeButton.hovered ? "#ffeaf2" : "#ffd9e8"
                border.color: "#d95f96"
                border.width: 2
            }

            contentItem: Text {
                text: parent.text
                color: "#b94f82"
                font.pixelSize: 16
                font.bold: true

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}