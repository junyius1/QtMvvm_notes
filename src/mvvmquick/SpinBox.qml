import QtQuick 2.12
import QtQuick.Controls 2.12

SpinBox {
	id: _edit
	property alias inputValue: _edit.value
	property alias minimum: _edit.from
	property alias maximum: _edit.to
	editable: true
}
