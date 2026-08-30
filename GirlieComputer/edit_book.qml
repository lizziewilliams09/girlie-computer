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

    property var book: null

    signal bookEdited()
    signal bookDeleted()

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    background: Rectangle {
        color: "#fff3f8"
        border.color: "#d95f96"
        border.width: 3
        radius: 18
    }

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
        spacing: 25

        Text {
            text: "♡ EDIT BOOK ♡"

            font.pixelSize: 28
            font.bold: true
            color: "#d95f96"

            Layout.alignment: Qt.AlignHCenter
        }

        GridLayout {
            columns: 2
            columnSpacing: 15
            rowSpacing: 12

            Text {
                text: "Title:"
                color: "#b86b8c"
                font.pixelSize: 16
            }

            TextField {
                id: titleInput

                text: book ? book.Title : ""

                Layout.preferredWidth: 250

                color: "#b94f82"
                font.pixelSize: 16

                background: Rectangle {
                    color: "#fffafd"
                    border.color: titleInput.activeFocus ? "#d95f96" : "#e8a9c4"
                    border.width: 2
                    radius: 8
                }
            }

            Text {
                text: "Author:"
                color: "#b86b8c"
                font.pixelSize: 16
            }

            TextField {
                id: authorInput

                text: book ? book.Author : ""

                Layout.preferredWidth: 250

                color: "#b94f82"
                font.pixelSize: 16

                background: Rectangle {
                    color: "#fffafd"
                    border.color: authorInput.activeFocus ? "#d95f96" : "#e8a9c4"
                    border.width: 2
                    radius: 8
                }
            }

            Text {
                text: "Date read:"
                color: "#b86b8c"
                font.pixelSize: 16
            }

            TextField {
                id: dateReadInput

                text: book ? book.DateRead : ""

                Layout.preferredWidth: 250

                color: "#b94f82"
                font.pixelSize: 16

                background: Rectangle {
                    color: "#fffafd"
                    border.color: dateReadInput.activeFocus ? "#d95f96" : "#e8a9c4"
                    border.width: 2
                    radius: 8
                }
            }

            Text {
                text: "Rating:"
                color: "#b86b8c"
                font.pixelSize: 16
            }

            TextField {
                id: ratingInput

                text: book ? book.Rating : ""

                Layout.preferredWidth: 250

                color: "#b94f82"
                font.pixelSize: 16

                background: Rectangle {
                    color: "#fffafd"
                    border.color: ratingInput.activeFocus ? "#d95f96" : "#e8a9c4"
                    border.width: 2
                    radius: 8
                }
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 15

            Button {
                id: deleteButton

                text: "DELETE BOOK"

                Layout.preferredWidth: 140
                Layout.preferredHeight: 45

                onClicked: {
                    backend.delete_item(
                        "books",
                        book.BookID
                    )

                    bookDeleted()
                    popup.close()
                }

                background: Rectangle {
                    radius: 10
                    color: deleteButton.hovered ? "#f3c1c1" : "#e59a9a"
                    border.color: "#b95f5f"
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

            Button {
                id: saveButton

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

                background: Rectangle {
                    radius: 10
                    color: saveButton.hovered ? "#f7b9d0" : "#f29abb"
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
    }
}