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

    // The book we clicked on
    property var book: null

    signal bookEdited()
    signal bookDeleted()

    background: Rectangle {
        color: "#fff3f8"
        border.color: "#d95f96"
        border.width: 3
        radius: 18
    }

    // X button
    Button {
        id: closeButton

        width: 35
        height: 35

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 10
        anchors.rightMargin: 10

        text: "×"

        onClicked: popup.close()

        background: Rectangle {
            color: closeButton.hovered ? "#ffd9e8" : "transparent"
            radius: 8
        }

        contentItem: Text {
            text: parent.text
            color: "#d95f96"
            font.pixelSize: 24
            font.bold: true

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }



    ColumnLayout {
        anchors.centerIn: parent
        spacing: 22

        Text {
            text: book ? "♡ " + book.Title.toUpperCase() + " ♡" : ""

            font.pixelSize: 26
            font.bold: true
            color: "#d95f96"

            Layout.alignment: Qt.AlignHCenter
        }

        GridLayout {
            columns: 2
            columnSpacing: 25
            rowSpacing: 18

            Text {
                text: "Title:"
                color: "#b86b8c"
                font.pixelSize: 16
                font.bold: true
            }

            Text {
                text: book ? book.Title : ""
                color: "#b94f82"
                font.pixelSize: 16
            }

            Text {
                text: "Author:"
                color: "#b86b8c"
                font.pixelSize: 16
                font.bold: true
            }

            Text {
                text: book ? book.Author : ""
                color: "#b94f82"
                font.pixelSize: 16
            }

            Text {
                text: "Date read:"
                color: "#b86b8c"
                font.pixelSize: 16
                font.bold: true
            }

            Text {
                text: book ? book.DateRead : ""
                color: "#b94f82"
                font.pixelSize: 16
            }

            Text {
                text: "Rating:"
                color: "#b86b8c"
                font.pixelSize: 16
                font.bold: true
            }

            Text {
                text: book ? book.Rating + " / 10" : ""
                color: "#b94f82"
                font.pixelSize: 16
            }
        }

        Button {
            id: editButton

            text: "EDIT BOOK"

            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 140
            Layout.preferredHeight: 45

            onClicked: {
                editBookPopup.book = book
                editBookPopup.open()
            }

            background: Rectangle {
                radius: 10
                color: editButton.hovered ? "#f7b9d0" : "#f29abb"
                border.color: "#c65380"
                border.width: 2
            }

            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                font.pixelSize: 16
                font.bold: true

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    EditBook {
        id: editBookPopup

        onBookEdited: {
            popup.bookEdited()
            popup.close()
        }

        onBookDeleted: {
            popup.bookDeleted()
            popup.close()
        }
    }
}