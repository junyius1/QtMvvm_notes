import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import de.framework.QtMvvm.Core 1.1
import de.framework.QtMvvm.Quick 1.1
import com.cross.notes 1.1

Page {
    id: tabView
    property MainViewModel viewModel: null
    readonly property bool presentAsRoot: true

    Connections {
      target: Qt.application
      onStateChanged: {
          if(Qt.application.state === Qt.ApplicationActive)
          {
              clipboard.showDialog(clipboard.text())
//              console.log(Qt.ApplicationActive," ",Qt.application.state )
          }
//          console.log("text=====", clipboard.text())
      }
    }

    header: ContrastToolBar {
        height: 56 + tabBar.height

        GridLayout {
            anchors.fill: parent
            rowSpacing: 0
            columnSpacing: 0
            columns: 2

            ActionButton {
                text: "≣"
                display: AbstractButton.TextOnly
                onClicked: QuickPresenter.toggleDrawer()
            }

            ToolBarLabel {
                text: qsTr("Note");
                Layout.fillWidth: true
                Layout.preferredHeight: 56
            }

            //tab view上面的工具条title条
            TabBar {
                id: tabBar
                Layout.columnSpan: 2
                Layout.fillWidth: true
                onCurrentIndexChanged: swipe.setCurrentIndex(currentIndex)
                Material.background: Material.primary

                TabButton {
                    text: "+"
                    onClicked: viewModel.addTab();
                }
            }
        }
    }

    PresenterProgress {}

    Clipboard {
        id:clipboard
        property string preText

        function showDialog(text){
            if(notesModel.getCurNodeName()===""){
                if(!notesModel.inputDialg)
                    notesModel.enterNoteName();
                return;
            }
            if(text !== preText){
                preText = text;
                // 弹出输入框
                Message.getInput("New Note", "Content:", "QString", function(result){
                    if(result === undefined) return;
                    var item = swipe.itemAt(swipe.count - 1)
                    //界面触发添加text到MainTabItemViewModel到notesmodel
                    item.viewModel.addData(result)
                }, text)
            }
        }
    }

    //tab 集合view
    SwipeView {
        id: swipe
        anchors.fill: parent
        onCurrentIndexChanged: tabBar.setCurrentIndex(currentIndex)
    }

    Component {
        id: _newTab
        TabButton {
            property MainTabItemViewModel viewModel: null

            text: viewModel.title
        }
    }

    NotesModel{
        id: testModel
    }

    Loader{
        id: testLoader
        sourceComponent: testModel
        onLoaded: {
            notesModel.enterNoteName()
        }
    }

    function presentTab(item) {
        tabBar.insertItem(tabBar.count - 1, _newTab.createObject(tabBar, {viewModel: item.viewModel}));
        item.parent = swipe;
        swipe.addItem(item);
        tabBar.setCurrentIndex(tabBar.count - 2);
        return true;
    }

    function afterPop() {
        while(tabBar.count > 0)
            tabBar.takeItem(0).destroy();
        while(swipe.count > 0)
            swipe.takeItem(0).destroy();
    }
}
