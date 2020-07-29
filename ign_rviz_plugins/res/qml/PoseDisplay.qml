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
import QtQuick.Dialogs 1.0
import "qrc:/QoSConfig"

Item {
  Layout.minimumWidth: 250
  Layout.minimumHeight: 395
  anchors.fill: parent
  anchors.margins: 10
  Column {
    width: parent.width

    RowLayout {
      width: parent.width
      RoundButton {
        text: "\u21bb"
        Material.background: Material.primary
        onClicked: {
          PoseDisplay.onRefresh();
        }
      }

      ComboBox {
        id: combo
        Layout.fillWidth: true
        model: PoseDisplay.topicList
        currentIndex: 0
        editable: true
        editText: currentText
        displayText: currentText
        onCurrentIndexChanged: {
          if (currentIndex < 0) {
            return;
          }

          PoseDisplay.setTopic(textAt(currentIndex));
        }

        Component.onCompleted: {
          combo.editText = "/pose"
          combo.displayText = "/pose"
        }

        Connections {
          target: PoseDisplay
          onSetCurrentIndex: {
            combo.currentIndex = index
          }
        }
      }
    }

    QoSConfig {
      onProfileUpdate: {
        PoseDisplay.updateQoS(depth, history, reliability, durability)
      }
    }

    RowLayout {
      width: parent.width

      Text {
        width: 75
        Layout.minimumWidth: 75
        text: "Shape"
        font.pointSize: 10.5
      }

      ComboBox {
        id: shapeCombo
        Layout.fillWidth: true
        currentIndex: 0
        model: [ "Arrow", "Axis" ]
        onCurrentIndexChanged: {
          if (currentIndex < 0) {
            return;
          }
          PoseDisplay.setShape(currentIndex === 0)
        }
      }
    }

    ColumnLayout {
      id: arrowConfig
      visible: shapeCombo.currentIndex === 0
      Layout.fillWidth: true
      Text {
        Layout.fillWidth: true
        text: "arrow config"
      }
    }

    ColumnLayout {
      id: axisConfig
      visible: shapeCombo.currentIndex === 1
      Text {
        text: "axis config"
      }
    }
  }
}
