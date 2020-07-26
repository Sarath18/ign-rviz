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
          PointStampedDisplay.onRefresh();
        }
      }

      ComboBox {
        id: combo
        Layout.fillWidth: true
        model: PointStampedDisplay.topicList
        currentIndex: 0
        editable: true
        editText: currentText
        displayText: currentText
        onCurrentIndexChanged: {
          if (currentIndex < 0) {
            return;
          }

          PointStampedDisplay.setTopic(textAt(currentIndex));
        }

        Component.onCompleted: {
          combo.editText = "/point"
          combo.displayText = "/point"
        }

        Connections {
          target: PointStampedDisplay
          onSetCurrentIndex: {
            combo.currentIndex = index
          }
        }
      }
    }

    QoSConfig {
      onProfileUpdate: {
        PointStampedDisplay.updateQoS(depth, history, reliability, durability)
      }
    }

    RowLayout {
      width: parent.width

      Text {
        width: 110
        Layout.minimumWidth: 110
        text: "History Length"
        font.pointSize: 10.5
      }

      TextField {
        id: historyTextField
        Layout.fillWidth: true
        text: "5"
        validator: IntValidator { 
          bottom: 1
          top: 1000 
        }
        onEditingFinished: {
          PointStampedDisplay.setHistoryLength(historyTextField.text);
        }
      }
    }
  }
}
