import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3
import de.framework.QtMvvm.Core 1.1
import de.framework.QtMvvm.Quick 1.1
import com.cross.notes 1.1

Component {

    Connections {
      target: notesModel
      onEnterNoteName: {
          if(notesModel.getCurNodeName()===""){
              if(!notesModel.inputDialog){
                  notesModel.inputDialog = true;
                  // 弹出输入框
                  Message.getInput("Enter Note Name", "Name:", "QString", function(result){
                      notesModel.addNoteName(result);
                  }, "")
              }
          }
      }
    }
}
