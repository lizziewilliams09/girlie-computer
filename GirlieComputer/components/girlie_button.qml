import QtQuick
import QtQuick.Controls.Basic

// Import reusable QML types from the parent GirlieComputer folder
import ".."

Button {
    id: root

    // -------------------------
    // COLOURS
    // -------------------------

    property color normalColor: Theme.actionButton
    property color hoverColor: Theme.actionButtonHover
    property color borderColor: Theme.actionButtonBorder
    property color textColor: Theme.white


    // -------------------------
    // SIZE / STYLE
    // -------------------------

    property int buttonRadius: Theme.buttonRadius
    property int buttonTextSize: Theme.buttonTextSize

    implicitWidth: 140
    implicitHeight: 46


    // -------------------------
    // BACKGROUND
    // -------------------------

    background: Rectangle {
        radius: root.buttonRadius

        color: root.hovered
               ? root.hoverColor
               : root.normalColor

        border.color: root.borderColor
        border.width: Theme.borderWidth
    }


    // -------------------------
    // TEXT
    // -------------------------

    contentItem: Text {
        text: root.text
        color: root.textColor

        font.pixelSize: root.buttonTextSize
        font.bold: true

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}