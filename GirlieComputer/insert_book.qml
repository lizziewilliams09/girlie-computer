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

    signal bookAdded()

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    background: Rectangle {
        color: Theme.background
        border.color: Theme.primary
        border.width: Theme.popupBorderWidth
        radius: Theme.popupRadius
    }

    // X button in top-right corner
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

            onClicked: {
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
}