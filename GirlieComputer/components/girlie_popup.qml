import QtQuick
import QtQuick.Controls.Basic

// Import reusable QML types from the parent GirlieComputer folder
import ".."

Popup {
    id: root

    anchors.centerIn: Overlay.overlay

    width: Theme.popupWidth
    height: Theme.popupHeight

    modal: true
    focus: true

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside


    // -------------------------
    // CUSTOM CONTENT
    // -------------------------

    default property alias popupContent: contentContainer.data


    // -------------------------
    // BACKGROUND
    // -------------------------

    background: Rectangle {
        color: Theme.background
        border.color: Theme.primary
        border.width: Theme.popupBorderWidth
        radius: Theme.popupRadius
    }


    // -------------------------
    // POPUP CONTENT
    // -------------------------

    Item {
        id: contentContainer
        anchors.fill: parent
    }


    // -------------------------
    // CLOSE BUTTON
    // -------------------------

    GirlieButton {
        text: "×"

        width: 35
        height: 35

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 10
        anchors.rightMargin: 10

        z: 10

        normalColor: "transparent"
        hoverColor: Theme.primarySoft
        borderColor: "transparent"
        textColor: Theme.primary

        buttonRadius: Theme.smallRadius
        buttonTextSize: Theme.closeButtonTextSize

        onClicked: root.close()
    }
}