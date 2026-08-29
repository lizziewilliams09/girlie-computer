import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Rectangle {
    color: "#fff3f8"

    Text {
        text: "♡ MY BOOKS ♡"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 45

        font.pixelSize: 34
        font.bold: true
        color: "#d95f96"
    }

    Button {
    id: homeButton

    text: "⌂  HOME"

    anchors.top: parent.top
    anchors.right: parent.right
    anchors.topMargin: 25
    anchors.rightMargin: 25

    width: 120
    height: 45

    onClicked: stackView.pop()

    background: Rectangle {
        radius: 12
        color: homeButton.hovered ? "#ffeaf2" : "#ffd9e8"
        border.color: "#d95f96"
        border.width: 2
    }

    contentItem: Text {
        text: parent.text
        color: "#b94f82"
        font.pixelSize: 17
        font.bold: true

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}

    // The actual bookshelf
    Rectangle {
        id: bookshelf

        width: 650
        height: 330

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 130

        color: "#d9a875"
        border.color: "#a86f43"
        border.width: 5
        radius: 6

        // Back of the bookshelf
        Rectangle {
            anchors.fill: parent
            anchors.margins: 14

            color: "#f0c99d"
            border.color: "#b77c4d"
            border.width: 3
        }

        // Shelf
        Rectangle {
            width: parent.width
            height: 18

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 90

            color: "#b77c4d"
        }

        // Our books will sit here
        Row {
            anchors.left: parent.left
            anchors.leftMargin: 35

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 108

            spacing: 8

            // ADD BOOK
            Button {
                id: addBook

                width: 65
                height: 130

                onClicked: insertBookPopup.open()

                background: Rectangle {
                    color: addBook.hovered ? "#ffd6e6" : "#f7a9c5"
                    border.color: "#c65380"
                    border.width: 3
                    radius: 4
                }

                contentItem: Text {
                    text: "+"
                    color: "#ffffff"

                    font.pixelSize: 45
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

    Text {
        text: "click + to add a book"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: bookshelf.bottom
        anchors.topMargin: 20

        font.pixelSize: 16
        color: "#b86b8c"
    }

    InsertBook {
            id: insertBookPopup
            }
    }
}