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
| Fade In and Out | 
| ------------- | 
|![lightmodealert](https://github.com/jadebowl/CustomAlertView/assets/57940508/63501581-8b1b-4f3f-9f21-d671d4983fea)|

| Position and No Title | Radius and No Message | Icon and Color | One Button |
| ------------- | ------------- | ------------- | ------------- |
| <img src="https://i.ibb.co/MDtVJSw/259062457-4bb75d54-0128-4dbe-a2b7-42341b50c8ee.png" alt="positionnotitle" width="222"> | <img src="https://i.ibb.co/F5Wj6dY/259063113-36cadbe4-914b-458b-a568-24aca26da015.png" alt="radiusnomessage" width="222"> | <img src="https://i.ibb.co/X4T9dTr/259059050-e83aa78d-b385-462d-8db0-fd2171245ff5.png" alt="iconandcolor" width="222"> | <img src="https://i.ibb.co/sRtHGT1/259062783-6ee53f09-219c-4cb3-b8b0-20c520ec86bf.png" alt="onebutton" width="222"> |

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
let alert = AlertView()
```

Customise the UI, add Fade transition and Constraints:
```swift
alert.delegate = self
alert.setupContents(accentColor: .systemBlue, backgroundColor: .systemBackground, title: "I am a title", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", agreeTitle: "Go to Settings", cancelTitle: "Cancel")
view.addSubview(alert)
alert.fadeIn(duration: 0.3)
alert.translatesAutoresizingMaskIntoConstraints = false
alert.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
alert.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
alert.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
alert.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
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
