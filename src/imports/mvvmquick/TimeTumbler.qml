import QtQuick 2.12
import QtQuick.Controls 2.12
import de.framework.QtMvvm.Quick 1.1

Tumbler {
	id: _timeTumbler

	ColorHelper {
		id: helper
	}

	Rectangle {
		anchors.centerIn: parent
		anchors.verticalCenterOffset: -0.5 * currentItem.height
		width: currentItem.width * 0.8
		height: 1
		color: parent.enabled ? helper.highlight : helper.text
	}

	Rectangle {
		anchors.centerIn: parent
		anchors.verticalCenterOffset: 0.5 * currentItem.height
		width: currentItem.width * 0.8
		height: 1
		color: parent.enabled ? helper.highlight : helper.text
	}
}
