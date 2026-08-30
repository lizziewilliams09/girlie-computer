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

    property var book: null

    signal bookEdited()
    signal bookDeleted()

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    background: Rectangle {
        color: Theme.background
        border.color: Theme.primary
        border.width: Theme.popupBorderWidth
        radius: Theme.popupRadius
    }

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

                onClicked: {
                    backend.delete_item(
                        "books",
                        book.BookID
                    )

                    bookDeleted()
                    popup.close()
                }
            }

            GirlieButton {
                text: "SAVE CHANGES"

                Layout.preferredWidth: 160
                Layout.preferredHeight: 45

                onClicked: {
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
        }
    }
}

