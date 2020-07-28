#!/usr/bin/env python3
# -*- coding: utf-8 -*-
##############################################################################
#
#    MyGNUHealth : Mobile and Desktop PHR node for GNU Health
#
#           MyGNUHealth is part of the GNU Health project
#
##############################################################################
#
#    GNU Health: The Free Health and Hospital Information System
#    Copyright (C) 2008-2020 Luis Falcon <falcon@gnuhealth.org>
#    Copyright (C) 2011-2020 GNU Solidario <health@gnusolidario.org>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
##############################################################################

import sys
from PySide2.QtWidgets import QApplication
from PySide2.QtCore import QObject, QUrl, Signal, Slot
from PySide2.QtQml import QQmlApplicationEngine, qmlRegisterType
from fedlogin import FederationLogin
from ghlogin import GHLogin
from bio import GHBio

from bloodpressure import BloodPressure
from glucose import Glucose
from weight import Weight
from osat import Osat

from myghconf import verify_installation_status

if __name__ == "__main__":
    app = QApplication(sys.argv)

    # Initial installation check
    verify_installation_status()

    # Register FedLogin to use in QML
    qmlRegisterType(FederationLogin, "FedLogin", 0, 1,
                    "FedLogin")


    # Register BloodPressure to use in QML
    qmlRegisterType(BloodPressure, "BloodPressure", 0, 1,
                    "BloodPressure")

    # Register Glucose to use in QML
    qmlRegisterType(Glucose, "Glucose", 0, 1,
                    "Glucose")

    # Register Weight to use in QML
    qmlRegisterType(Weight, "Weight", 0, 1,
                    "Weight")

    # Register Osat to use in QML
    qmlRegisterType(Osat, "Osat", 0, 1,
                    "Osat")

    # Register GHLogin to use in QML
    qmlRegisterType(GHLogin, "GHLogin", 0, 1,
                    "GHLogin")

    # Register GHBio to use in QML
    qmlRegisterType(GHBio, "GHBio", 0, 1,
                    "GHBio")

    engine = QQmlApplicationEngine()

    url = QUrl("qml/main.qml")
    engine.load(url)

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec_())
