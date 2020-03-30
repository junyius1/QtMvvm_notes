import QtQuick 2.12
import QtQuick.Controls 2.12

TextField {
	id: _edit
	property alias inputValue: _edit.text
	property string regexp: ""
	property string patternOptions

	selectByMouse: true
	validator: regexp != "" ? _validator.createObject(_edit) : null

	Component {
		id: _validator
		RegExpValidator {
			regExp: new RegExp(_edit.regexp, optionsAsString(_edit.patternOptions))

			function optionsAsString(options) {
				var resStr;
				if((options & 0x0001) != 0) //QRegularExpression::CaseInsensitiveOption
					resStr += "i";
				if((options & 0x0004) != 0) //QRegularExpression::MultilineOption
					resStr += "m";
				if((options & 0x0040) != 0) //QRegularExpression::UseUnicodePropertiesOption
					resStr += "u";
				return resStr;
			}
		}
	}
}
