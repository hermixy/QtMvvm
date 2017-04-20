import QtQuick 2.8
import QtQuick.Controls 2.1
import de.skycoder42.quickextras 2.0
import de.skycoder42.qtmvvm.quick 1.0
import com.example.qtmvvmdatasync 1.0

Page {
	id: mainView
	property MainControl control: null

	header: ActionBar {
		id: toolbar
		title: qsTr("MainControl")
		showMenuButton: false

		AppBarButton {
			imageSource: "image://svg/de/skycoder42/quickextras/icons/ic_more_vert"
			text: "Datasync Status"

			onClicked: control.showDataSync()
		}
	}

	PresenterProgress {}
}
