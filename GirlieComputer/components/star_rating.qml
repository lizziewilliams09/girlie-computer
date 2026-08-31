import QtQuick
import QtQuick.Shapes

import ".."

Row {
    property int rating: 0
    spacing: 3

    Repeater {
        model: 10

        Shape {
            width: 16
            height: 16

            ShapePath {
                strokeColor: Theme.primary
                strokeWidth: 1.5
                fillColor: index < rating ? Theme.primary : "transparent"

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
        }
    }
}