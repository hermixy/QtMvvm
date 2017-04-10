import QtQuick 2.8
import QtQuick.Controls 2.1
import de.skycoder42.quickextras 1.0
import de.skycoder42.qtmvvm.quick 1.0
import com.example.mvvmexample 1.0

Page {
	id: mainView
	property MainControl control: null

	header: ActionBar {
		id: toolbar
		title: "Main Control"
		showMenuButton: false
	}

	PresenterProgress {
		z: 10
	}
}
