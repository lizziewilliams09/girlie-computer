import QtQuick
import QtQuick.Controls.Basic

// Import QML types from the parent folder
import ".."

GirlieButton {
    text: "←  BACK"

    anchors.top: parent.top
    anchors.left: parent.left
    anchors.topMargin: 25
    anchors.leftMargin: 25

    width: 120
    height: 45

    normalColor: Theme.primarySoft
    hoverColor: Theme.primaryHover
    borderColor: Theme.primary
    textColor: Theme.primaryDark

    buttonRadius: Theme.mediumRadius
    buttonTextSize: Theme.homeButtonTextSize

    onClicked: stackView.pop()
}