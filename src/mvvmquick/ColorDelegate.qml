import QtQuick 2.12
import de.framework.QtMvvm.Quick 1.1 as QtMvvm

QtMvvm.MsgDelegate {
	id: _colorDelegate

	editDialogType: "QColor"
	indicatorComponent: Rectangle {
		id: colorCircle
		width: 24
		height: 24
		radius: height / 2
		color: inputValue
	}
}
