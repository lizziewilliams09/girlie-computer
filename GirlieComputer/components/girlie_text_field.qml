import QtQuick
import QtQuick.Controls.Basic

// Import reusable QML types from the parent GirlieComputer folder
import ".."

TextField {
    id: root

    // -------------------------
    // TEXT
    // -------------------------

    color: Theme.primaryDark
    placeholderTextColor: Theme.placeholderText

    font.pixelSize: Theme.bodySize


    // -------------------------
    // DEFAULT SIZE
    // -------------------------

    implicitWidth: 250


    // -------------------------
    // BACKGROUND
    // -------------------------

    background: Rectangle {
        color: Theme.inputBackground

        border.color: root.activeFocus
                      ? Theme.primary
                      : Theme.inputBorder

        border.width: Theme.borderWidth
        radius: Theme.smallRadius
    }
}