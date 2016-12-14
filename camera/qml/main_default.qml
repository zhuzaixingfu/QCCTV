/*
 * Copyright (c) 2016 Alex Spataru
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE
 */

import QtQuick 2.0
import Qt.labs.settings 1.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0

import "."

ApplicationWindow {
    id: app
    
    //
    // Geometry options
    //
    width: 720
    height: 480
    color: "#000"
    visible: true
    x: isMobile ? 0 : 100
    y: isMobile ? 0 : 100
    title: AppDspName + " " + AppVersion

    //
    // Settings
    //
    Settings {
        property alias x: app.x
        property alias y: app.y
        property alias width: app.width
        property alias height: app.height
    }

    //
    // Styling options
    //
    Material.theme: Material.Dark
    Material.accent: Material.Teal

    //
    // Show maximized the window on launch
    //
    Component.onCompleted: {
        if (isMobile)
            showMaximized()
        else
            showNormal()
    }

    //
    // Update the video output image automatically
    //
    Connections {
        target: QCCTVCamera

        onImageChanged: {
            image.source = ""
            image.source = "image://qcctv/"
        }
    }

    //
    // Video output image
    //
    Image {
        id: image
        cache: false
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }

    //
    // Common interface
    //
    Interface {
        anchors.fill: parent
    }
}
