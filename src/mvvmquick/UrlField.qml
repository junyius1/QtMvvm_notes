import QtQuick 2.12
import QtQuick.Controls 2.12
import de.framework.QtMvvm.Quick.Private 1.0

TextField {
	id: _edit
	property alias inputValue: _edit.text
	property alias allowedSchemes: _validator.allowedSchemes

	selectByMouse: true
	validator: UrlValidator {
		id: _validator
	}
}
