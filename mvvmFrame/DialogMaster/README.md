# DialogMaster
A utility to create optimized dialogs with Qt

## Features
Provides a namespace with improved versions of all the dialogs Qt provides. By using these, things like modality, titles and window decoration get handled by the system.
The dialogs include:

- A generic method to setup any QDialog
- QMessageBox, with the common methods as well as a setup for custom message boxes
- QInputDialog
- QProgressDialog
- QFileDialog
- QColorDialog
- QFontDialog

## Installation
The package is provided via qdep, as `Skycoder42/DialogMaster`. To use it simply:

1. Install and enable qdep (See [qdep - Installing](https://github.com/Skycoder42/qdep#installation))
2. Add the following to your pro file:
```qmake
QDEP_DEPENDS += Skycoder42/DialogMaster
!load(qdep):error("Failed to load qdep feature! Run 'qdep prfgen --qmake $$QMAKE_QMAKE' to create it.")
```
