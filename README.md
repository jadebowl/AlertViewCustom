<p align="center">
   <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" alt="SPM">
   </a>
</p>

# CustomAlertView

<p align="left">
With CustomAlertView you can create a simple custom alert instead of using the default one from Apple, which doesn't always fit in with the style of your app.
</p>

## Features

- Add Icon
- Personalise Title, Message and both Buttons
- Possibility to hide Title, Message and Cancel Button
- Change Alert Position (.center or .bottom)
- Change Agree Button Corner Radius
- Change Agree Button Color
- Change View Background Color

## Example
| Position and No Title | Radius and No Message | Icon and Color | One Button |
| ------------- | ------------- | ------------- | ------------- |
| <img src="https://i.ibb.co/BqSsqfS/positionmessage.png" alt="positionnotitle" width="222"> | <img src="https://i.ibb.co/KV48H8z/onlytitlecorner.png" alt="radiusnomessage" width="222"> | <img src="https://i.ibb.co/fGwxSr4/icontitle.png" alt="iconandcolor" width="222"> | <img src="https://i.ibb.co/Jm4kZP4/onebutton.png" alt="onebutton" width="222"> |

## Installation

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
```swift
import CustomAlert

let alert = AlertView()
```

Customise the UI and add the Fade transition:
```swift
alert.delegate = self
alert.setupContents(accentColor: .systemBlue,
                            backgroundColor: .systemBackground,
                            icon: UIImage(systemName: "hand.wave"),
                            title: "I am a title",
                            message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            agreeTitle: "Go to Settings",
                            cancelTitle: "Cancel",
                            position: .bottom,
                            hostVC: self)
alert.fadeIn(duration: 0.3)
```

Manage Actions:
```swift
extension ViewController: AlertViewDelegate {
    func agreeAction() {
        // Example: Go to Settings
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
