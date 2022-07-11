import sys

from PySide2.QtWidgets import QApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtQuickControls2 import QQuickStyle

if __name__ == '__main__':
    main = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    QQuickStyle.setStyle("Material")
    ctx = engine.rootContext()
    engine.load('MainWindow.qml')
    win = engine.rootObjects()[0]

    win.show()
    sys.exit(main.exec_())
