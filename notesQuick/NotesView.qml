import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3
import de.framework.QtMvvm.Core 1.1
import de.framework.QtMvvm.Quick 1.1
import com.cross.notes 1.1

Page {
    id: tabView
    property NotesViewModel viewModel: null

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
                text: qsTr("Catalog")
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
            if(text !== preText){
                preText = text;
                // 弹出输入框
                Message.getInput("New Note", "Content:", "QString", function(){
                    var item = swipe.itemAt(swipe.count - 1)
                    //界面触发添加text到MainTabItemViewModel到notesmodel
                    item.viewModel.addData(text)
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
            property NotesTabItemViewModel viewModel: null

            text: viewModel.title
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
