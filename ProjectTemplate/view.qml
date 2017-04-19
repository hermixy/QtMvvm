import QtQuick 2.8
import QtQuick.Controls 2.1
import de.skycoder42.quickextras 2.0
import de.skycoder42.qtmvvm.quick 1.0
import com.example.%{ProjectLowerName} 1.0

Page {
	id: mainView
	property %{ControlCn} control: null

	header: ActionBar {
		id: toolbar
		title: qsTr("%{ControlClassName}")
		showMenuButton: false
@if '%{UseSettings}'

		moreMenu: Menu {
			MenuItem {
				id: settings
				text: qsTr("Settings")
				onClicked: control.showSettings()
			}
		}
@endif
	}

	PresenterProgress {}
}
