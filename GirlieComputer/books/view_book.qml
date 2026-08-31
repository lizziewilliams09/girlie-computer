import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

// Import QML types from the parent folder
import ".."

GirliePopup {
    id: popup

    // The book we clicked on
    property var book: null

    signal bookEdited()
    signal bookDeleted()

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

            StarRating {
                rating: book ? book.Rating : 0
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