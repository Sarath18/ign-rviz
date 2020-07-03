/*
 * Copyright (C) 2020 Open Source Robotics Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
*/
import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1

Item {
  Layout.minimumWidth: 250
  Layout.minimumHeight: 280
  anchors.fill: parent
  anchors.margins: 10

  ColumnLayout {
    width: parent.width
    spacing: 6

    CheckBox {
      checked: true
      text: "Show Names"
      onClicked: { TFDisplay.showNames(checked) }
    }

    CheckBox {
      checked: true
      text: "Show Axes"
      onClicked: { TFDisplay.showAxes(checked) }
    }

    CheckBox {
      checked: false
      text: "Show Axes Head"
      onClicked: { TFDisplay.showAxesHead(checked) }
    }

    CheckBox {
      checked: true
      text: "Show Arrows"
      onClicked: { TFDisplay.showArrows(checked) }
    }

    RowLayout {
      width: parent.width
      spacing: 10

      Text {
        width: 80
        Layout.minimumWidth: 50
        text: "Marker Scale"
        font.pointSize: 10.5
      }

      TextField {
        id: markerScale
        Layout.fillWidth: true
        Layout.minimumWidth: 50
        width: 150
        placeholderText: "1"
        onEditingFinished: {
           TFDisplay.setMarkerScale(markerScale.text)
        }
      }
    }
  }
}