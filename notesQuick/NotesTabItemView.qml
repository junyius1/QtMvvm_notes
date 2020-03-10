import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import de.framework.QtMvvm.Core 1.1
import de.framework.QtMvvm.Quick 1.1
import com.cross.notes 1.1

Pane {
    property NotesTabItemViewModel viewModel: null

    GridLayout {
        columns: 2
        anchors.fill: parent

        ListView {
            id: lView
            Layout.columnSpan: 2
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true

            ScrollBar.vertical: ScrollBar {}

            model: viewModel.notesModel

            delegate: WordsDelegate {}
        }
    }
}
