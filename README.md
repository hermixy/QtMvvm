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
The easiest way to get started is to use the Qt Project template. Simply copy the contents of `ProjectTemplate` to the path described here ([Locating Wizards](https://doc.qt.io/qtcreator/creator-project-wizards.html#locating-wizards)) and create a QtMvvm Project via QtCreators project wizard. In that case, you can skip the first steps and only need to install qpm dependencies. To do so, simply go to the Core, Widgets and Quick directories and run `qpm install` inside of them. However, you should still read all steps to learn how QtMvvm works.

### Step 1 - Create the core project
### Step 2 - Add the core code
### Step 3 - Create gui project(s)
### Step 4 - Add the gui code 

## Installation
All those modules are available as qpm packages. To install any of them:

1. Install qpm (See [GitHub - Installing](https://github.com/Cutehacks/qpm/blob/master/README.md#installing))
2. In your projects root directory, run `qpm install de.skycoder42.qtmvvm...` (The package you need)
3. Include qpm to your project by adding `include(vendor/vendor.pri)` to your `.pro` file

Check their [GitHub - Usage for App Developers](https://github.com/Cutehacks/qpm/blob/master/README.md#usage-for-app-developers) to learn more about qpm.