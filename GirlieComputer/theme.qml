pragma Singleton

import QtQuick

QtObject {

    // -------------------------
    // MAIN COLOURS
    // -------------------------

    property color background: "#fff3f8"

    property color primary: "#d95f96"
    property color primaryDark: "#b94f82"
    property color primarySoft: "#ffd9e8"
    property color primaryHover: "#ffeaf2"

    property color secondaryText: "#b86b8c"

    property color inputBackground: "#fffafd"
    property color inputBorder: "#e8a9c4"
    property color placeholderText: "#c98ba6"

    property color white: "#ffffff"


    // -------------------------
    // ACTION BUTTONS
    // -------------------------

    property color actionButton: "#f29abb"
    property color actionButtonHover: "#f7b9d0"
    property color actionButtonBorder: "#c65380"


    // -------------------------
    // DELETE / DANGER
    // -------------------------

    property color dangerButton: "#e59a9a"
    property color dangerButtonHover: "#f3c1c1"
    property color dangerButtonBorder: "#b95f5f"


    // -------------------------
    // SECTION COLOURS
    // -------------------------

    property color souvenirsAccent: "#e66b8e"
    property color souvenirsSoft: "#ffd6df"
    property color souvenirsHover: "#ffe8ee"
    property color souvenirsText: "#c64f76"

    property color musicAccent: "#a77bd6"
    property color musicSoft: "#e8dcff"
    property color musicHover: "#f2ebff"
    property color musicText: "#8d62bd"

    property color booksAccent: "#e4b94d"
    property color booksSoft: "#fff0bd"
    property color booksHover: "#fff7da"
    property color booksText: "#c89122"

    property color filmsAccent: "#7da2d6"
    property color filmsSoft: "#dce9ff"
    property color filmsHover: "#edf3ff"
    property color filmsText: "#6688bd"

    property color diaryAccent: "#e78078"
    property color diarySoft: "#ffd6cf"
    property color diaryHover: "#ffe9e4"
    property color diaryText: "#cc675f"


    // -------------------------
    // SIZING / SHAPE
    // -------------------------

    property int borderWidth: 2

    property int smallRadius: 8
    property int buttonRadius: 10
    property int mediumRadius: 12
    property int largeButtonRadius: 14
    property int popupRadius: 18


    // -------------------------
    // FONT SIZES
    // -------------------------

    property int pageTitleSize: 34
    property int popupTitleSize: 28
    property int detailTitleSize: 26
    property int closeButtonTextSize: 24
    property int bodySize: 16
    property int buttonTextSize: 16
    property int homeButtonTextSize: 17
    property int menuButtonTextSize: 20
    property int largeMenuButtonTextSize: 22


    // -------------------------
    // POPUPS
    // -------------------------

    property int popupWidth: 450
    property int popupHeight: 350
    property int popupBorderWidth: 3
}