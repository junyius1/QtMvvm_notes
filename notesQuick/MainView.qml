import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import de.framework.QtMvvm.Core 1.1
import de.framework.QtMvvm.Quick 1.1
import com.example.notes 1.0

Page {
    id: mainView
    property MainViewModel viewModel: null

    header: ContrastToolBar {
        RowLayout {
            anchors.fill: parent
            spacing: 0

            ToolBarLabel {
                text: qsTr("MainViewModel")
                Layout.fillWidth: true
            }
        }
    }

    PresenterProgress {}

    Pane {
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent

            TextField {
                id: textEdit
                Layout.fillWidth: true

                MvvmBinding {
                    viewModel: mainView.viewModel
                    viewModelProperty: "text"
                    view: textEdit
                    viewProperty: "text"
                }
            }

            Label {
                id: textLabel
                Layout.fillWidth: true

                MvvmBinding {
                    viewModel: mainView.viewModel
                    viewModelProperty: "text"
                    view: textLabel
                    viewProperty: "text"
                    type: MvvmBinding.OneWayToView
                }
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }
}
