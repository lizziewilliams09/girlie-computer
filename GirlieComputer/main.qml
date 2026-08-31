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

                GirlieButton {
                    text: "✿  MY WORLD  ✿"

                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: 300
                    Layout.preferredHeight: 60

                    normalColor: Theme.primarySoft
                    hoverColor: Theme.primaryHover
                    borderColor: Theme.primary
                    textColor: Theme.primaryDark

                    buttonRadius: Theme.largeButtonRadius
                    buttonTextSize: Theme.largeMenuButtonTextSize
                }

                GridLayout {
                    columns: 2
                    columnSpacing: 24
                    rowSpacing: 18
                    Layout.alignment: Qt.AlignHCenter

                    GirlieButton {
                        text: "★  SOUVENIRS"

                        Layout.preferredWidth: 220
                        Layout.preferredHeight: 70

                        normalColor: Theme.souvenirsSoft
                        hoverColor: Theme.souvenirsHover
                        borderColor: Theme.souvenirsAccent
                        textColor: Theme.souvenirsText

                        buttonRadius: Theme.largeButtonRadius
                        buttonTextSize: Theme.menuButtonTextSize
                    }

                    GirlieButton {
                        text: "♫  MUSIC"

                        Layout.preferredWidth: 220
                        Layout.preferredHeight: 70

                        normalColor: Theme.musicSoft
                        hoverColor: Theme.musicHover
                        borderColor: Theme.musicAccent
                        textColor: Theme.musicText

                        buttonRadius: Theme.largeButtonRadius
                        buttonTextSize: Theme.menuButtonTextSize
                    }

                    GirlieButton {
                        text: "📖  BOOKS"

                        Layout.preferredWidth: 220
                        Layout.preferredHeight: 70

                        normalColor: Theme.booksSoft
                        hoverColor: Theme.booksHover
                        borderColor: Theme.booksAccent
                        textColor: Theme.booksText

                        buttonRadius: Theme.largeButtonRadius
                        buttonTextSize: Theme.menuButtonTextSize

                        onClicked: stackView.push(booksPage)
                    }

                    GirlieButton {
                        text: "🎬  FILMS"

                        Layout.preferredWidth: 220
                        Layout.preferredHeight: 70

                        normalColor: Theme.filmsSoft
                        hoverColor: Theme.filmsHover
                        borderColor: Theme.filmsAccent
                        textColor: Theme.filmsText

                        buttonRadius: Theme.largeButtonRadius
                        buttonTextSize: Theme.menuButtonTextSize
                    }
                }

                GirlieButton {
                    text: "✎  DIARY  ✎"

                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: 300
                    Layout.preferredHeight: 60

                    normalColor: Theme.diarySoft
                    hoverColor: Theme.diaryHover
                    borderColor: Theme.diaryAccent
                    textColor: Theme.diaryText

                    buttonRadius: Theme.largeButtonRadius
                    buttonTextSize: Theme.largeMenuButtonTextSize
                }
            }
        }
    }

    // -------------------------
    // PAGES
    // -------------------------

    Component {
        id: booksPage

        Books {
        }
    }
}
