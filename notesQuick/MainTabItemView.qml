import QtQuick 2.10
import QtQuick.Controls 2.3
import de.framework.QtMvvm.Core 1.1
import de.framework.QtMvvm.Quick 1.1
import com.cross.notes 1.1

Pane {
	property MainTabItemViewModel viewModel: null

	Switch {
		anchors.centerIn: parent
		text: viewModel.title
	}
}
