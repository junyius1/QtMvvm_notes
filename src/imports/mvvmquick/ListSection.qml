import QtQuick 2.12
import QtQuick.Controls 2.12
import de.framework.QtMvvm.Quick 1.1

Label {
	property string title

	width: parent.width
	font.bold: true
	font.capitalization: Font.SmallCaps
	padding: 16
	bottomPadding: 4
	text: title + qsTr(":")

	ColorHelper {
		id: helper
	}

	background: Rectangle {
		anchors.fill: parent
		color: "transparent"

		Rectangle {
			anchors.left: parent.left
			anchors.bottom: parent.bottom
			anchors.right: parent.right
			height: 2
			color: helper.highlight
		}
	}
}
