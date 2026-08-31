import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

// Import QML types from the parent folder
import ".."

Rectangle {
    id: booksPage

    color: Theme.background

    property var books: []

    Component.onCompleted: {
        books = backend.get_items("books")
    }

    Text {
        text: "♡ MY BOOKS ♡"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 45

        font.pixelSize: Theme.pageTitleSize
        font.bold: true
        color: Theme.primary
    }

    GirlieHomeButton {}
    GirlieBackButton {}

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

        // Books + add button
        Row {
            anchors.left: parent.left
            anchors.leftMargin: 35

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 108

            spacing: 8

            Repeater {
                model: books

                Rectangle {
                    id: bookSpine

                    width: 65
                    height: 130

                    color: bookMouseArea.containsMouse
                           ? "#f1bdd2"
                           : "#e8a9c4"

                    border.color: Theme.primaryDark
                    border.width: Theme.popupBorderWidth
                    radius: 4

                    Text {
                        text: modelData.Title

                        anchors.centerIn: parent

                        width: parent.height - 10

                        color: Theme.white
                        font.pixelSize: 14
                        font.bold: true

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                        rotation: -90

                        elide: Text.ElideRight
                    }

                    MouseArea {
                        id: bookMouseArea

                        anchors.fill: parent

                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            viewBookPopup.book = modelData
                            viewBookPopup.open()
                        }
                    }
                }
            }

            // ADD BOOK
            GirlieButton {
                text: "+"

                width: 65
                height: 130

                normalColor: Theme.actionButton
                hoverColor: Theme.actionButtonHover
                borderColor: Theme.actionButtonBorder
                textColor: Theme.white

                buttonRadius: 4
                buttonTextSize: 45

                onClicked: insertBookPopup.open()
            }
        }
    }

    Text {
        text: "click + to add a book"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: bookshelf.bottom
        anchors.topMargin: 20

        font.pixelSize: Theme.bodySize
        color: Theme.secondaryText
    }

    InsertBook {
        id: insertBookPopup

        onBookAdded: {
            books = backend.get_items("books")
        }
    }

    ViewBook {
        id: viewBookPopup

        onBookEdited: {
            books = backend.get_items("books")
        }

        onBookDeleted: {
            books = backend.get_items("books")
        }
    }
}
