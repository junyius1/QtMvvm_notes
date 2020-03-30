import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Universal 2.12
import de.framework.QtMvvm.Quick 1.1

/*! @brief A helper class to get style-dependant colors
 *
 * @extends QtQuick.Controls.Control
 *
 * Simply instanciate a helper within some control. It will pick up the style settings from
 * what it is in and provide them via the properties
 *
 * @sa ContrastToolBar
 */
Control {
	id: _colorHelper
	visible: false

	/*! @brief The color to use to highlight stuff
	 *
	 * @default{<i>style dependant</i>}
	 *
	 *  Style		| Value
	 * -------------|-------
	 *  Material	| Material.accent
	 *  Universal	| Universal.accent
	 *	Others		| palette.highlight
	 *
	 * @accessors{
	 *	@memberAc{highlight}
	 *  @notifyAc{highlightChanged()}
	 * }
	 */
	readonly property color highlight: {
		if(QuickPresenter.currentStyle === "Material")
			return Material.accent;
		else if(QuickPresenter.currentStyle === "Universal")
			return Universal.accent;
		else
			return palette.highlight;
	}

	/*! @brief The color to use for text
	 *
	 * @default{<i>style dependant</i>}
	 *
	 *  Style		| Value
	 * -------------|-------
	 *  Material	| Material.foreground
	 *  Universal	| Universal.foreground
	 *	Others		| palette.windowText
	 *
	 * @accessors{
	 *	@memberAc{text}
	 *  @notifyAc{textChanged()}
	 * }
	 */
	readonly property color text: {
		if(QuickPresenter.currentStyle === "Material")
			return Material.foreground;
		else if(QuickPresenter.currentStyle === "Universal")
			return Universal.foreground;
		else
			return palette.windowText;
	}
}
