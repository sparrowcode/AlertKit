# AlertKit

**Popup from Apple Music & Feedback in AppStore**. Contains `Done`, `Heart`, `Error` and other. Supports Dark Mode.
I tried to recreate Apple's alerts as much as possible. You can find these alerts in the AppStore after feedback and after you add a song to your library in Apple Music.

![Alert Kit v5](https://cdn.sparrowcode.io/github/alertkit/v5/preview-v1_2.png)

For UIKit & SwiftUI call this:

```swift
AlertKitAPI.present(
    title: "Added to Library",
    icon: .done,
    style: .iOS17AppleMusic,
    haptic: .success
)
```

Available 2 styles:

```swift
public enum AlertViewStyle {

    case iOS16AppleMusic
    case iOS17AppleMusic
}
```

### iOS Dev Community

<p float="left">
    <a href="https://twitter.com/i/communities/1730194338489987403">
        <img src="https://cdn.sparrowcode.io/github/badges/x-community.png?version=1" height="52">
    </a>
    <a href="#apps-using">
        <img src="https://cdn.sparrowcode.io/github/badges/download-on-the-appstore.png?version=4" height="52">
    </a>
</p>

## Navigate

- [Installation](#installation)
  - [Swift Package Manager](#swift-package-manager)
  - [CocoaPods](#cocoapods)
- [SwiftUI](#swiftui)
- [Present & Dismiss](#present--dismiss)
- [Customisation](#customisation)
- [Apps Using](#apps-using)

## Installation

Ready to use on iOS 13+. Supports iOS and visionOS. Working with `UIKit` and `SwiftUI`.

### Swift Package Manager

In Xcode go to Project -> Your Project Name -> `Package Dependencies` -> Tap _Plus_. Insert url:

```
https://github.com/sparrowcode/AlertKit
```

or adding it to the `dependencies` of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/sparrowcode/AlertKit", .upToNextMajor(from: "5.1.8"))
]
```

### CocoaPods:

This is an outdated way of doing things. I advise you to use [SPM](#swift-package-manager). However, I will continue to support Cocoapods for some time.

<details><summary>Cocoapods Instalation</summary>

[CocoaPods](https://cocoapods.org) is a dependency manager. For usage and installation instructions, visit their website. To integrate using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SPAlert'
```

</details>

### Manually

If you prefer not to use any of dependency managers, you can integrate manually. Put `Sources/AlertKit` folder in your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

## SwiftUI

You can use basic way via `AlertKitAPI` or call via modifier:

```swift
let alertView = AlertAppleMusic17View(title: "Hello", subtitle: nil, icon: .done)

VStack {}
    .alert(isPresent: $alertPresented, view: alertView)
```

## Customisation

If you need customisation fonts, icon, colors or any other, make view:

```swift
let alertView = AlertAppleMusic17View(title: "Added to Library", subtitle: nil, icon: .done)

// change font
alertView.titleLabel.font = UIFont.systemFont(ofSize: 21)
// change color
alertView.titleLabel.textColor = .white
```

## Present & Dismiss

You can present and dismiss alerts manually via view.

```swift
let alertView = AlertAppleMusic17View(title: "Added to Library", subtitle: nil, icon: .done)

// present
alertView.present(on: self)
// and dismiss
alertView.dismiss()
```

For dismiss all alerts that was presented: 

```swift
AlertKitAPI.dismissAllAlerts()
```

## Apps Using

<p float="left">
    <a href="https://apps.apple.com/app/id1624477055"><img src="https://cdn.sparrowcode.io/github/apps-using/id1624477055.png?v=2" height="65"></a>
    <a href="https://apps.apple.com/app/id1625641322"><img src="https://cdn.sparrowcode.io/github/apps-using/id1625641322.png?v=2" height="65"></a>
    <a href="https://apps.apple.com/app/id1625641322"><img src="https://cdn.sparrowcode.io/github/apps-using/id6449774982.png?v=2" height="65"></a>
    <a href="https://apps.apple.com/app/id875280793"><img src="https://cdn.sparrowcode.io/github/apps-using/id875280793.png?v=2" height="65"></a>
    <a href="https://apps.apple.com/app/id743843090"><img src="https://cdn.sparrowcode.io/github/apps-using/id743843090.png?v=2" height="65"></a>
    <a href="https://apps.apple.com/app/id537070378"><img src="https://cdn.sparrowcode.io/github/apps-using/id537070378.png?v=2" height="65"></a>
    <a href="https://apps.apple.com/app/id1617055933"><img src="https://cdn.sparrowcode.io/github/apps-using/id1617055933.png?v=2" height="65"></a>
    <a href="https://apps.apple.com/app/id1668579869"><img src="https://cdn.sparrowcode.io/github/apps-using/id1668579869.png?v=1" height="65"></a>
    <a href="https://apps.apple.com/app/id6451087813"><img src="https://cdn.sparrowcode.io/github/apps-using/id6451087813.png?v=1" height="65"></a>
    <a href="https://apps.apple.com/us/app/id1462481042"><img src="https://firebasestorage.googleapis.com/v0/b/linetime-197b7.appspot.com/o/iOS%20Icon%20More%20Space.png?alt=media&token=5d6fc783-6499-4ba0-9401-229ab88cb328" height="65"></a>
</p>

If you use a `AlertKit`, add your app via Pull Request.
