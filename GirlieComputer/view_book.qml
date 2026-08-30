import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Popup {
    id: popup

    anchors.centerIn: Overlay.overlay

    width: Theme.popupWidth
    height: Theme.popupHeight

    modal: true
    focus: true

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    // The book we clicked on
    property var book: null

    signal bookEdited()
    signal bookDeleted()

    background: Rectangle {
        color: Theme.background
        border.color: Theme.primary
        border.width: Theme.popupBorderWidth
        radius: Theme.popupRadius
    }

    // X button
    GirlieButton {
        text: "×"

        width: 35
        height: 35

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 10
        anchors.rightMargin: 10

        normalColor: "transparent"
        hoverColor: Theme.primarySoft
        borderColor: "transparent"
        textColor: Theme.primary

        buttonRadius: Theme.smallRadius
        buttonTextSize: Theme.closeButtonTextSize

        onClicked: popup.close()
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 22

        Text {
            text: book ? "♡ " + book.Title.toUpperCase() + " ♡" : ""

            font.pixelSize: Theme.detailTitleSize
            font.bold: true
            color: Theme.primary

            Layout.alignment: Qt.AlignHCenter
        }

        GridLayout {
            columns: 2
            columnSpacing: 25
            rowSpacing: 18

            Text {
                text: "Title:"
                color: Theme.secondaryText
                font.pixelSize: Theme.bodySize
                font.bold: true
            }

            Text {
                text: book ? book.Title : ""
                color: Theme.primaryDark
                font.pixelSize: Theme.bodySize
            }

            Text {
                text: "Author:"
                color: Theme.secondaryText
                font.pixelSize: Theme.bodySize
                font.bold: true
            }

            Text {
                text: book ? book.Author : ""
                color: Theme.primaryDark
                font.pixelSize: Theme.bodySize
            }

            Text {
                text: "Date read:"
                color: Theme.secondaryText
                font.pixelSize: Theme.bodySize
                font.bold: true
            }

            Text {
                text: book ? book.DateRead : ""
                color: Theme.primaryDark
                font.pixelSize: Theme.bodySize
            }

            Text {
                text: "Rating:"
                color: Theme.secondaryText
                font.pixelSize: Theme.bodySize
                font.bold: true
            }

            Text {
                text: book ? book.Rating + " / 10" : ""
                color: Theme.primaryDark
                font.pixelSize: Theme.bodySize
            }
        }

        GirlieButton {
            text: "EDIT BOOK"

            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 140
            Layout.preferredHeight: 45

            onClicked: {
                editBookPopup.book = book
                editBookPopup.open()
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