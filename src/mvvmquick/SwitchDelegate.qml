import QtQuick 2.12
import QtQuick.Controls 2.12 as Controls
import QtQuick.Layouts 1.12
import de.framework.QtMvvm.Quick 1.1

Controls.SwitchDelegate {
	id: _boolDelegate

	text: title

	checked: inputValue
	onCheckedChanged: {
		if(inputValue !== checked)
			inputValue = checked;
	}

	Controls.ToolTip.visible: pressed && tooltip != ""
	Controls.ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
	Controls.ToolTip.text: tooltip
	onPressAndHold: QuickPresenter.hapticLongPress()

	contentItem: GridLayout {
		columns: 2
		rows: 2

		Controls.Label {
			id: _titleLabel
			text: _boolDelegate.text
			Layout.row: 0
			Layout.column: 0
			font.bold: true
			elide: Label.ElideRight
			Layout.fillWidth: true
		}

		Controls.Label {
			id: _previewLabel
			visible: preview
			Layout.row: 1
			Layout.column: 0
			text: preview
			wrapMode: Text.WordWrap
			Layout.fillWidth: true
		}

		Item {
			Layout.row: 0
			Layout.column: 1
			Layout.rowSpan: 2
			Layout.minimumWidth: implicitWidth
			Layout.maximumWidth: implicitWidth
			implicitWidth: _boolDelegate.indicator.width + 14
		}
	}
}
