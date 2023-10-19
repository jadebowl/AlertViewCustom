[![SPM compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)]([https://swift.org/package-manager/](https://github.com/apple/swift-package-manager))
[![Version](https://img.shields.io/cocoapods/v/AlertViewCustom.svg?style=flat)](https://cocoapods.org/pods/AlertViewCustom) 
[![License](https://img.shields.io/cocoapods/l/AlertViewCustom.svg?style=flat)](https://cocoapods.org/pods/AlertViewCustom)


[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fjadebowl%2FAlertViewCustom%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/jadebowl/AlertViewCustom)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/85d7d6bc1ccb4666ab9ef5b251b27621)](https://app.codacy.com/gh/jadebowl/AlertViewCustom/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)


# AlertViewCustom

<p align="left">
With AlertViewCustom you can create your own customised UIAlertView instead of using the default one from Apple, which doesn't always fit in with the style of your app.
</p>

## Features
- Can be used both in UIKit and SwiftUI
- Add Icon
- Personalise Title, Message and both Buttons
- Possibility to hide Title, Message and Cancel Button
- Change Alert Position (.center or .bottom)
- Change Agree Button Corner Radius
- Change Agree Button Color
- Change View Background Color
- Change Corner Radius of the whole AlertView
- Add Animation from the Bottom when in .bottom Position

### Latest Updates:
- Possibility to change Font
- Possibility to have the Agree Button Outlined

## Examples
<table>
  <tr>
    <th>Position & No Title</th>
    <th>Font Custom</th>
    <th>Icon & Color</th>
    <th>One Button</th>
  </tr>
  <tr>
    <td align="center"><img src="https://i.ibb.co/pQhJpns/notitle.png" alt="Position & No Title" height="325" width="150"></td>
    <td align="center"><img src="https://i.ibb.co/hC8CT2C/fontcustom.png" alt="Font Custom" height="325" width="150"></td>
    <td align="center"><img src="https://i.ibb.co/ZfqtykP/iconcolor.png" alt="Icon & Color" height="325" width="150"></td>
    <td align="center"><img src="https://i.ibb.co/RNQFVKF/onebutton.png" alt="One Button" height="325" width="150"></td>
  </tr>
   <tr>
    <th>Outlined Button</th>
    <th>Radius & No Message</th>
    <th></th>
    <th></th>
  </tr>
  <tr>
    <td align="center"><img src="https://i.ibb.co/YXjWGB2/outlinebutton.png" alt="Outlined Button & View Radius" height="325" width="150"></td>
    <td align="center"><img src="https://i.ibb.co/X2NZ3t3/nomessage.png" alt="Radius & No Message" height="325" width="150"></td>
    <td></td>
    <td></td>
  </tr>
</table>

## Installation

### Swift Package Manager

To integrate using Apple's [Swift Package Manager](https://swift.org/package-manager/), add the following as a dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/jadebowl/AlertViewCustom.git", from: "4.0.0")
]
```

Alternatively navigate to your Xcode project, select `Swift Packages` and click the `+` icon to search for `AlertViewCustom`.

### CocoaPods

AlertViewCustom is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AlertViewCustom'
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate AlertViewCustom into your project manually. Simply drag the `Sources` Folder into your Xcode project.

## Usage

Create an Alert:
```swift
import AlertViewCustom

var alert = AlertView()
```

Customise the UI and add the Fade transition:
```swift
let agreeButton = AgreeButton(title: "Go to Settings")
let alertSettings = AlertSettings(accentColor: .systemBlue,
                                backgroundColor: .systemBackground,
                                icon: UIImage(systemName: "hand.wave"),
                                title: "I am a title",
                                message: "Lorem ipsum dolor sit amet, consectetuadipiscing elit, sed do eiusmod tempor incididunt ulabore et dolore magna aliqua.",
                                agreeButton: agreeButton,
                                cancelTitle: "Cancel",
                                position: .bottom(animated: true))
alert.setupContents(delegate: self, settings: alertSettings)
alert.fadeIn(duration: 0.3)
```

Manage Actions:
```swift
extension Controller: AlertViewDelegate {
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
