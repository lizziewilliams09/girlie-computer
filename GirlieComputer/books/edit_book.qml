import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

// Import QML types from the parent folder
import ".."

GirliePopup {
    id: popup

    property var book: null

    signal bookEdited()
    signal bookDeleted()

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 25

        Text {
            text: "♡ EDIT BOOK ♡"

            font.pixelSize: Theme.popupTitleSize
            font.bold: true
            color: Theme.primary

            Layout.alignment: Qt.AlignHCenter
        }

        GridLayout {
            columns: 2
            columnSpacing: 15
            rowSpacing: 12

            Text {
                text: "Title:"
                color: Theme.secondaryText
                font.pixelSize: Theme.bodySize
            }

            GirlieTextField {
                id: titleInput
                text: book ? book.Title : ""
            }

            Text {
                text: "Author:"
                color: Theme.secondaryText
                font.pixelSize: Theme.bodySize
            }

            GirlieTextField {
                id: authorInput
                text: book ? book.Author : ""
            }

            Text {
                text: "Date read:"
                color: Theme.secondaryText
                font.pixelSize: Theme.bodySize
            }

            GirlieTextField {
                id: dateReadInput
                text: book ? book.DateRead : ""
            }

            Text {
                text: "Rating:"
                color: Theme.secondaryText
                font.pixelSize: Theme.bodySize
            }

            GirlieTextField {
                id: ratingInput
                text: book ? book.Rating : ""
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 15

            GirlieButton {
                text: "DELETE BOOK"

                Layout.preferredWidth: 140
                Layout.preferredHeight: 45

                normalColor: Theme.dangerButton
                hoverColor: Theme.dangerButtonHover
                borderColor: Theme.dangerButtonBorder
                textColor: Theme.white

                onClicked: confirmDeletePopup.open()
            }

            GirlieButton {
                text: "SAVE CHANGES"

                Layout.preferredWidth: 160
                Layout.preferredHeight: 45

                onClicked: confirmSavePopup.open()
            }
        }
    }


    // -------------------------
    // SAVE CONFIRMATION
    // -------------------------

    GirlieConfirmPopup {
        id: confirmSavePopup

        titleText: "♡ SAVE CHANGES? ♡"
        messageText: "Are you sure you want to save these changes?"

        onConfirmed: {
            backend.edit_item(
                "books",
                book.BookID,
                [
                    titleInput.text,
                    authorInput.text,
                    dateReadInput.text,
                    ratingInput.text
                ]
            )

            bookEdited()
            popup.close()
        }
    }


    // -------------------------
    // DELETE CONFIRMATION
    // -------------------------

    GirlieConfirmPopup {
        id: confirmDeletePopup

        titleText: "♡ DELETE BOOK? ♡"
        messageText: "Are you sure you want to delete this book?"

        onConfirmed: {
            backend.delete_item(
                "books",
                book.BookID
            )

            bookDeleted()
            popup.close()
        }
    }
}