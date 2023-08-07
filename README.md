<p align="center">
   <img width="200" src="https://raw.githubusercontent.com/SvenTiigi/SwiftKit/gh-pages/readMeAssets/SwiftKitLogo.png" alt="CustomAlert Logo">
</p>

<p align="center">
   <a href="https://developer.apple.com/swift/">
      <img src="https://img.shields.io/badge/Swift-5.2-orange.svg?style=flat" alt="Swift 5.2">
   </a>
   <a href="http://cocoapods.org/pods/CustomAlert">
      <img src="https://img.shields.io/cocoapods/v/CustomAlert.svg?style=flat" alt="Version">
   </a>
   <a href="http://cocoapods.org/pods/CustomAlert">
      <img src="https://img.shields.io/cocoapods/p/CustomAlert.svg?style=flat" alt="Platform">
   </a>
   <a href="https://github.com/Carthage/Carthage">
      <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage Compatible">
   </a>
   <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" alt="SPM">
   </a>
</p>

# CustomAlert

<p align="left">
With CustomAlertView you can create a simple Alert instead of using the default one from Apple which doesn't always fit in with the style of your app.
</p>

## Features

- [x] Personalise Title, Message and both Buttons
- [x] Change Accent Color
- [x] Change Background Color

## Example

<p align="center">
![lightmodealert](https://github.com/jadebowl/CustomAlertView/assets/57940508/0c2327f2-70e7-431c-b144-6e09d295a14a)
![darkmodealert](https://github.com/jadebowl/CustomAlertView/assets/57940508/0ac2c3f6-73a0-482c-9645-f98c7e4d0e88)
</p>

## Installation

### CocoaPods

CustomAlertView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```bash
pod 'CustomAlert'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

To integrate CustomAlert into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "jadebowl/CustomAlertView"
```

Run `carthage update --use-xcframeworks` to build the framework and drag the built `CustomAlert.xcframework` bundles from Carthage/Build into the "Frameworks and Libraries" section of your application’s Xcode project.

### Swift Package Manager

To integrate using Apple's [Swift Package Manager](https://swift.org/package-manager/), add the following as a dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/jadebowl/CustomAlertView.git", from: "1.0.0")
]
```

Alternatively navigate to your Xcode project, select `Swift Packages` and click the `+` icon to search for `CustomAlert`.

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate CustomAlert into your project manually. Simply drag the `Sources` Folder into your Xcode project.

## Usage

Create an AlertView:
```ogdl
let alert = AlertView()
```

Customise the UI, add Fade transition and Constraints:
```ogdl
        alert.setupContents(accentColor: .purple, backgroundColor: .systemBackground, title: "I am a title", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", agreeTitle: "Go to Settings", cancelTitle: "Cancel")
        view.addSubview(alert)
        alert.fadeIn(duration: 0.3)
        alert.translatesAutoresizingMaskIntoConstraints = false
        alert.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        alert.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        alert.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        alert.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
```

Manage Actions:
```ogdl
extension ViewController: AlertViewDelegate {
    func agreeAction() {
        // MARK: - Example: Go to Settings
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                print("Settings opened: \(success)")
            })
        }
    }
    
    func cancelAction() {
        alert.removeFromSuperView(duration: 0.3)
    }
}
```

## Contributing
Contributions are very welcome 🙌

## License

```
CustomAlert
Copyright (c) 2023 Giada Ciotola giada@beatcode.it

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

