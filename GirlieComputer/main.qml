import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Window {
    width: 800
    height: 600
    visible: true
    title: "Girlie Computer"
    color: "#fff3f8"

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Rectangle {
            color: "#fff3f8"

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 24

                Text {
                    text: "♡ GIRLIE COMPUTER ♡"
                    font.pixelSize: 34
                    font.bold: true
                    color: "#d95f96"
                    Layout.alignment: Qt.AlignHCenter
                }

                Button {
                    id: myWorldButton

                    text: "✿  MY WORLD  ✿"
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: 300
                    Layout.preferredHeight: 60

                    background: Rectangle {
                        radius: 14
                        color: myWorldButton.hovered ? "#ffeaf2" : "#ffd9e8"
                        border.color: "#d95f96"
                        border.width: 2
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "#b94f82"
                        font.pixelSize: 22
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                GridLayout {
                    columns: 2
                    columnSpacing: 24
                    rowSpacing: 18
                    Layout.alignment: Qt.AlignHCenter

                    Button {
                        id: souvenirsButton

                        text: "★  SOUVENIRS"
                        Layout.preferredWidth: 220
                        Layout.preferredHeight: 70

                        background: Rectangle {
                            radius: 14
                            color: souvenirsButton.hovered ? "#ffe8ee" : "#ffd6df"
                            border.color: "#e66b8e"
                            border.width: 2
                        }

                        contentItem: Text {
                            text: parent.text
                            color: "#c64f76"
                            font.pixelSize: 20
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Button {
                        id: musicButton

                        text: "♫  MUSIC"
                        Layout.preferredWidth: 220
                        Layout.preferredHeight: 70

                        background: Rectangle {
                            radius: 14
                            color: musicButton.hovered ? "#f2ebff" : "#e8dcff"
                            border.color: "#a77bd6"
                            border.width: 2
                        }

                        contentItem: Text {
                            text: parent.text
                            color: "#8d62bd"
                            font.pixelSize: 20
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Button {
                        id: booksButton

                        text: "📖  BOOKS"
                        Layout.preferredWidth: 220
                        Layout.preferredHeight: 70

                        onClicked: stackView.push("books.qml")

                        background: Rectangle {
                            radius: 14
                            color: booksButton.hovered ? "#fff7da" : "#fff0bd"
                            border.color: "#e4b94d"
                            border.width: 2
                        }

                        contentItem: Text {
                            text: parent.text
                            color: "#c89122"
                            font.pixelSize: 20
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Button {
                        id: filmsButton

                        text: "🎬  FILMS"
                        Layout.preferredWidth: 220
                        Layout.preferredHeight: 70

                        background: Rectangle {
                            radius: 14
                            color: filmsButton.hovered ? "#edf3ff" : "#dce9ff"
                            border.color: "#7da2d6"
                            border.width: 2
                        }

                        contentItem: Text {
                            text: parent.text
                            color: "#6688bd"
                            font.pixelSize: 20
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }

                Button {
                    id: diaryButton

                    text: "✎  DIARY  ✎"
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: 300
                    Layout.preferredHeight: 60

                    background: Rectangle {
                        radius: 14
                        color: diaryButton.hovered ? "#ffe9e4" : "#ffd6cf"
                        border.color: "#e78078"
                        border.width: 2
                    }

                    contentItem: Text {
                        text: parent.text
                        color: "#cc675f"
                        font.pixelSize: 22
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }
}