# QUrlValidator
A class that provides a QValidator to validate urls

Can be used just like any [QValidator](https://doc.qt.io/qt-5/qvalidator.html). Can be limited to only accept specific schemes.

## Installation
The package is provided via qdep, as `Skycoder42/QUrlValidator`. To use it simply:

1. Install and enable qdep (See [qdep - Installing](https://github.com/Skycoder42/qdep#installation))
2. Add the following to your pro file:
```qmake
QDEP_DEPENDS += Skycoder42/QUrlValidator
!load(qdep):error("Failed to load qdep feature! Run 'qdep prfgen --qmake $$QMAKE_QMAKE' to create it.")
```