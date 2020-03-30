import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import de.framework.QtMvvm.Core 1.1
import de.framework.QtMvvm.Quick 1.1
import com.cross.notes 1.1

Pane {
	property MainTabItemViewModel viewModel: null

    GridLayout {
        columns: 2
        anchors.fill: parent

        ListView {
            id: lView
            Layout.columnSpan: 2
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            currentIndex: -1

            ScrollBar.vertical: ScrollBar {}

            model: viewModel.wordsModel

            delegate: WordsDelegate {}
        }
    }
}
