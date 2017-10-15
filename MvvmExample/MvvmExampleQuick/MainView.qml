import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import de.skycoder42.quickextras 2.0
import de.skycoder42.qtmvvm.quick 1.0
import com.example.mvvmexample 1.0

Page {
	id: mainView
	property MainControl control: null

	header: ActionBar {
		id: toolbar
		title: qsTr("MainControl")
		showMenuButton: false

		moreMenu: Menu {
			MenuItem {
				id: settings
				text: qsTr("Settings")
				onClicked: control.showSettings()
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

				QtMvvmBinding {
					control: mainView.control
					controlProperty: "text"
					view: textEdit
					viewProperty: "text"
				}
			}

			Label {
				id: textLabel
				Layout.fillWidth: true

				QtMvvmBinding {
					control: mainView.control
					controlProperty: "text"
					view: textLabel
					viewProperty: "text"
					type: QtMvvmBinding.OneWayFromControl
				}
			}

			Item {
				Layout.fillHeight: true
			}
		}
	}
}
