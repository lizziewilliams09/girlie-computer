import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Window {
    width: 800
    height: 600
    visible: true
    title: "Girlie Computer"
    color: Theme.background

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Rectangle {
            color: Theme.background

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 24

                Text {
                    text: "♡ GIRLIE COMPUTER ♡"
                    font.pixelSize: Theme.pageTitleSize
                    font.bold: true
                    color: Theme.primary
                    Layout.alignment: Qt.AlignHCenter
                }

                Button {
                    id: myWorldButton

                    text: "✿  MY WORLD  ✿"
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: 300
                    Layout.preferredHeight: 60

                    background: Rectangle {
                        radius: Theme.largeButtonRadius
                        color: myWorldButton.hovered
                               ? Theme.primaryHover
                               : Theme.primarySoft

                        border.color: Theme.primary
                        border.width: Theme.borderWidth
                    }

                    contentItem: Text {
                        text: parent.text
                        color: Theme.primaryDark
                        font.pixelSize: Theme.largeMenuButtonTextSize
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
                            radius: Theme.largeButtonRadius
                            color: souvenirsButton.hovered
                                   ? Theme.souvenirsHover
                                   : Theme.souvenirsSoft

                            border.color: Theme.souvenirsAccent
                            border.width: Theme.borderWidth
                        }

                        contentItem: Text {
                            text: parent.text
                            color: Theme.souvenirsText
                            font.pixelSize: Theme.menuButtonTextSize
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
                            radius: Theme.largeButtonRadius
                            color: musicButton.hovered
                                   ? Theme.musicHover
                                   : Theme.musicSoft

                            border.color: Theme.musicAccent
                            border.width: Theme.borderWidth
                        }

                        contentItem: Text {
                            text: parent.text
                            color: Theme.musicText
                            font.pixelSize: Theme.menuButtonTextSize
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
                            radius: Theme.largeButtonRadius
                            color: booksButton.hovered
                                   ? Theme.booksHover
                                   : Theme.booksSoft

                            border.color: Theme.booksAccent
                            border.width: Theme.borderWidth
                        }

                        contentItem: Text {
                            text: parent.text
                            color: Theme.booksText
                            font.pixelSize: Theme.menuButtonTextSize
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
                            radius: Theme.largeButtonRadius
                            color: filmsButton.hovered
                                   ? Theme.filmsHover
                                   : Theme.filmsSoft

                            border.color: Theme.filmsAccent
                            border.width: Theme.borderWidth
                        }

                        contentItem: Text {
                            text: parent.text
                            color: Theme.filmsText
                            font.pixelSize: Theme.menuButtonTextSize
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
                        radius: Theme.largeButtonRadius
                        color: diaryButton.hovered
                               ? Theme.diaryHover
                               : Theme.diarySoft

                        border.color: Theme.diaryAccent
                        border.width: Theme.borderWidth
                    }

                    contentItem: Text {
                        text: parent.text
                        color: Theme.diaryText
                        font.pixelSize: Theme.largeMenuButtonTextSize
                        font.bold: true

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }
}
