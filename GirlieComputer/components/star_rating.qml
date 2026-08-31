import QtQuick
import QtQuick.Shapes

import ".."

Row {
    id: root

    property int rating: 0
    property bool editable: false

    spacing: 3

    Repeater {
        model: 10

        Shape {
            width: 16
            height: 16

            ShapePath {
                strokeColor: Theme.primary
                strokeWidth: 1.5
                fillColor: index < root.rating
                           ? Theme.primary
                           : "transparent"

                startX: 8
                startY: 1

                PathLine { x: 10; y: 6 }
                PathLine { x: 15; y: 6 }
                PathLine { x: 11; y: 9 }
                PathLine { x: 13; y: 15 }
                PathLine { x: 8;  y: 11 }
                PathLine { x: 3;  y: 15 }
                PathLine { x: 5;  y: 9 }
                PathLine { x: 1;  y: 6 }
                PathLine { x: 6;  y: 6 }
                PathLine { x: 8;  y: 1 }
            }

            MouseArea {
                anchors.fill: parent
                enabled: root.editable
                hoverEnabled: root.editable

                cursorShape: root.editable
                            ? Qt.PointingHandCursor
                            : Qt.ArrowCursor

                onClicked: {
                    root.rating = index + 1
                }
            }
        }
    }
}