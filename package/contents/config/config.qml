/*
    SPDX-FileCopyrightText: 2021 qewer33
    SPDX-License-Identifier: GPL-3.0-or-later
*/

import QtQuick 2.12
import org.kde.plasma.configuration 2.0

ConfigModel {
    ConfigCategory {
         name: i18n("Appearance")
         icon: "preferences-desktop-color"
         source: "configAppearance.qml"
    }
}
