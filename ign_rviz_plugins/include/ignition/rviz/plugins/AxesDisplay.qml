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

Item {
  Layout.minimumWidth: 250
  Layout.minimumHeight: 200
  anchors.fill: parent
  anchors.margins: 10

  RowLayout {
    width: parent.width
    spacing: 10
        
    TextField {
      id: frameField
      Layout.fillWidth: true
      Layout.minimumWidth: 50
      width: 150
      placeholderText: "Frame"
      text: "<Fixed Frame>"
    }

    Button {
      width: 50
      text: "Set"
      onClicked: { AxesDisplay.setFrame(frameField.text) }
    }
  }
}