import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

// Import QML types from the parent folder
import ".."

GirliePopup {
    id: popup

    signal bookAdded()

    onClosed: {
        titleInput.text = ""
        authorInput.text = ""
        dateReadInput.text = ""
        ratingInput.text = ""
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 25

        Text {
            text: "♡ ADD A BOOK ♡"

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
                placeholderText: "Book title..."
            }

            Text {
                text: "Author:"
                color: Theme.secondaryText
                font.pixelSize: Theme.bodySize
            }

            GirlieTextField {
                id: authorInput
                placeholderText: "Author..."
            }

            Text {
                text: "Date read:"
                color: Theme.secondaryText
                font.pixelSize: Theme.bodySize
            }

            GirlieTextField {
                id: dateReadInput
                placeholderText: "YYYY-MM-DD"
            }

            Text {
                text: "Rating:"
                color: Theme.secondaryText
                font.pixelSize: Theme.bodySize
            }

            GirlieTextField {
                id: ratingInput
                placeholderText: "1–10"
            }
        }

        GirlieButton {
            text: "ADD BOOK"

            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 140
            Layout.preferredHeight: 45

            onClicked: confirmAddPopup.open()
        }
    }


    // -------------------------
    // ADD CONFIRMATION
    // -------------------------

    GirlieConfirmPopup {
        id: confirmAddPopup

        titleText: "♡ ADD BOOK? ♡"
        messageText: "Are you sure you want to add this book?"

        onConfirmed: {
            backend.add_item(
                "books",
                [
                    titleInput.text,
                    authorInput.text,
                    dateReadInput.text,
                    ratingInput.text
                ]
            )

            bookAdded()
            popup.close()
        }
    }
}