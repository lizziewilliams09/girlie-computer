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
            color: closeButton.hovered
                   ? Theme.primarySoft
                   : "transparent"

            radius: Theme.smallRadius
        }

        contentItem: Text {
            text: parent.text
            color: Theme.primary
            font.pixelSize: Theme.closeButtonTextSize
            font.bold: true

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
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

            TextField {
                id: titleInput

                placeholderText: "Book title..."

                Layout.preferredWidth: 250

                color: Theme.primaryDark
                placeholderTextColor: Theme.placeholderText
                font.pixelSize: Theme.bodySize

                background: Rectangle {
                    color: Theme.inputBackground

                    border.color: titleInput.activeFocus
                                  ? Theme.primary
                                  : Theme.inputBorder

                    border.width: Theme.borderWidth
                    radius: Theme.smallRadius
                }
            }

            Text {
                text: "Author:"
                color: Theme.secondaryText
                font.pixelSize: Theme.bodySize
            }

            TextField {
                id: authorInput

                placeholderText: "Author..."

                Layout.preferredWidth: 250

                color: Theme.primaryDark
                placeholderTextColor: Theme.placeholderText
                font.pixelSize: Theme.bodySize

                background: Rectangle {
                    color: Theme.inputBackground

                    border.color: authorInput.activeFocus
                                  ? Theme.primary
                                  : Theme.inputBorder

                    border.width: Theme.borderWidth
                    radius: Theme.smallRadius
                }
            }

            Text {
                text: "Date read:"
                color: Theme.secondaryText
                font.pixelSize: Theme.bodySize
            }

            TextField {
                id: dateReadInput

                placeholderText: "YYYY-MM-DD"

                Layout.preferredWidth: 250

                color: Theme.primaryDark
                placeholderTextColor: Theme.placeholderText
                font.pixelSize: Theme.bodySize

                background: Rectangle {
                    color: Theme.inputBackground

                    border.color: dateReadInput.activeFocus
                                  ? Theme.primary
                                  : Theme.inputBorder

                    border.width: Theme.borderWidth
                    radius: Theme.smallRadius
                }
            }

            Text {
                text: "Rating:"
                color: Theme.secondaryText
                font.pixelSize: Theme.bodySize
            }

            TextField {
                id: ratingInput

                placeholderText: "1–10"

                Layout.preferredWidth: 250

                color: Theme.primaryDark
                placeholderTextColor: Theme.placeholderText
                font.pixelSize: Theme.bodySize

                background: Rectangle {
                    color: Theme.inputBackground

                    border.color: ratingInput.activeFocus
                                  ? Theme.primary
                                  : Theme.inputBorder

                    border.width: Theme.borderWidth
                    radius: Theme.smallRadius
                }
            }
        }

        // Save the book
        Button {
            id: addBookButton

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

            background: Rectangle {
                radius: Theme.buttonRadius

                color: addBookButton.hovered
                       ? Theme.actionButtonHover
                       : Theme.actionButton

                border.color: Theme.actionButtonBorder
                border.width: Theme.borderWidth
            }

            contentItem: Text {
                text: parent.text
                color: Theme.white
                font.pixelSize: Theme.buttonTextSize
                font.bold: true

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
