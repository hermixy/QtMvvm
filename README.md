# QtMvvm
A mvvm oriented library for Qt, to create Projects for Widgets and Quick in parallel

**Note:** This project consists of many small github repositories. This repository is a meta-repository to keep documentation etc. in one place. Read the [Installation](#installation) chapter to learn how to use those repos.

## Features
The main feature of QtMvvm is the seperation between ui and logic. With this library, you can create a core library, containing your application logic, as well as ui controllers, and create multiple ui projects on top of it. This way you can for example provide both, a widgets and a qt quick based application, or create different uis for different devices. The key features are:

- The Control class to represent an ui element in your core app. Allows you to expose properties, signals and slots to the ui and control the application flow from your core app
- The IPresenter as interface to be implemented on each ui project. This is the part that presents uis based on controls
- The CoreApp to control the application startup independently of the QApplication used
- Functions to show messageboxes from your core app
	- Supports even input dialogs, with default edits as well as the option to add custom inputs

Another feature is the QtMvvmSettings module. This extends the QtMvvm projects by adding ui independent settings.

- Create a control and an xml file describing the settings ui in your core app
- Automatically creates a ui for widgets or quick based on the xml
	- Supports search as well as a reset functionality
	- Utilizes the same edits as the input dialogs

Check the example application in this repository to see more. See [Example - README](Example/README.md).

## Modules
- **QtMvvm** - The QtMvvm library itself
	- [`de.skycoder42.qtmvvm.core`](https://github.com/Skycoder42/QtMvvmCore) - The core part of qtmvvm
	- [`de.skycoder42.qtmvvm.widgets`](https://github.com/Skycoder42/QtMvvmWidgets) - The basic frontend for QtWidgets
	- [`de.skycoder42.qtmvvm.quick`](https://github.com/Skycoder42/QtMvvmQuick) - The basic frontend for QtQuick Controls 2Modules
- **QtMvvmSettings** - A module adding an easy way to create settings dialogs
	- [`de.skycoder42.qtmvvm.settings.core`](https://github.com/Skycoder42/QtMvvmSettingsCore) - The core part of the settings module (the logic)
	- [`de.skycoder42.qtmvvm.settings.widgets`](https://github.com/Skycoder42/QtMvvmSettingsWidgets) - The ui implementation for QtWidgets
	- [`de.skycoder42.qtmvvm.settings.quick`](https://github.com/Skycoder42/QtMvvmSettingsQuick) - The ui implementation for QtQuick Controls 2
	
## Requirements
QtMvvm heavily relies on [qpm](https://www.qpm.io/). Check [GitHub - Installing](https://github.com/Cutehacks/qpm/blob/master/README.md#installing) to learn how to install qpm. You can of course use the project without qpm, but in that case you will have to collect all the dependencies by yourself. If you are unfamiliar with qpm, no worries, it's really easy to use.
	
## Gettings started
The following chapters will explain how to create a QtMvvm Project and how to correctly implement applications with it

### Add the custom wizard
Tho create a new QtMvvm project, you can use a custom wizard for QtCreator. You will have to add it to your computer once. To do this, you will have to copy the contents of the [`ProjectTemplate`](ProjectTemplate) folder to a location known by QtCreator. The locations ca be found here: [Locating Wizards](https://doc.qt.io/qtcreator/creator-project-wizards.html#locating-wizards). If you are, for example, working on linux, create a new folder called `QtMvvm` inside of `$HOME/.config/QtProject/qtcreator/templates/wizards` and copy the contents there. After restarting QtCreator, the project template should appear in the `Applications` section of the new-dialog as `QtMvvm Application Project`.

### Create and initialize the QtMvvm Project
Follow the setup to create the project. You can select the GUI-frontends you want to use, as well as additional features. After the project has been created, qpm dependencies needs to be installed (Sadly, this cannot be done by the wizard). To install them, simply run `qpm install` inside of every sub-project:

```sh
cd MyProjectCore
qpm install
cd ..

cd MyProjectWidgets
qpm install
cd ..

cd MyProjectQuick
qpm install
cd ..
```

Once that's done, the project should build and run successfully. (**Note:** Don't be irritated by the long build time. The qpm dependencies must be built initially, for all 3 projects. But since those don't change, only the first build/rebuilds take longer)

### Adding new controls
Finally, you may need to add custom controls. Currently, there is no custom wizard for that, but I may try to create one as well. Creating a new control can be done by the following steps:

#### Create the control
- Add a new c++ class to your core project. Let it inherit from `Control` and your done with the core part. You can show the control by creating one and calling `Control::show`
- See [`MvvmExample/MvvmExampleCore/maincontrol.h`](MvvmExample/MvvmExampleCore/maincontrol.h) for an example control

#### Create the widgets ui
- Create a new widget class in your widgets gui project.
- In order to use it as widget for a control, you should name it accordingly: If your control is named `MyCustomControl`, the widgets name must start with `MyCustom` as well (e.g. `MyCustomWindow`, `MyCustomDialog`, etc.)
- Modify the constructor to look like this: `Q_INVOKABLE MyCustomWindow(Control *mControl, QWidget *parent = nullptr);` (with the name adjusted to your class)
- Create a member variable with your control type, e.g. `MyCustomControl *control;`
- In the constructors implementation, cast the `mControl` to your control class and assign it to `control`
- As final step, you need to register the widget. This can be done by adding the line `WidgetPresenter::registerWidget<MyCustomWindow>();` to your `main.cpp`, before calling `QApplication::exec`
- See [`MvvmExample/MvvmExampleWidgets/mainwindow.h`](MvvmExample/MvvmExampleWidgets/mainwindow.h) for an example widget

#### Create the quick ui
- *Optional:* Register the control for qml. This way autocomplete will work. Add the line `qmlRegisterUncreatableType<MyCustomControl>("com.example.mvvmexample", 1, 0, "MyCustomControl", "Controls cannot be created!");` to your main cpp before creating the engine.
- Create a new qml file inside of the folder `:/qml/views` (This is required to automatically find the view).
- In order to use it as view for a control, you should name it accordingly: If your control is named `MyCustomControl`, the views name must start with `MyCustom` as well (e.g. `MyCustomView`, `MyCustomActivity`, etc.)
- Add the following imports to the qml file:
```qml
import QtQuick 2.8
import QtQuick.Controls 2.1
import de.skycoder42.quickextras 1.0
import de.skycoder42.qtmvvm.quick 1.0
import com.example.mvvmexample 1.0 //adjust to the module defined in your main.cpp
```
- Add a property named control to the root element: `property MyCustomControl control: null` (If you did not register the control, use `var` instead of `MyCustomControl` as property type)
- Add a presenter progress element to the root element. This way lazy loading view will show a progress: `PresenterProgress {}`
- See [`MvvmExample/MvvmExampleQuick/MainView.qml`](MvvmExample/MvvmExampleQuick/MainView.qml) for an example widget

## Understanding how QtMvvm works
The next step, of course, is to understand how it works. You can use your created project as reference, but this section will explain it based on the `MvvmExample` project.

## Installation
All those modules are available as qpm packages. To install any of them:

1. Install qpm (See [GitHub - Installing](https://github.com/Cutehacks/qpm/blob/master/README.md#installing))
2. In your projects root directory, run `qpm install de.skycoder42.qtmvvm...` (The package you need)
3. Include qpm to your project by adding `include(vendor/vendor.pri)` to your `.pro` file

Check their [GitHub - Usage for App Developers](https://github.com/Cutehacks/qpm/blob/master/README.md#usage-for-app-developers) to learn more about qpm.