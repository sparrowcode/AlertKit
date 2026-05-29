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
- [SwiftUI](#swiftui)
- [Present & Dismiss](#present--dismiss)
- [Customisation](#customisation)
- [Apps Using](#apps-using)

## Installation

Ready to use on iOS 13+. Supports iOS and visionOS. Working with `UIKit` and `SwiftUI`.

### Swift Package Manager

In Xcode go to Project -> Your Project Name -> `Package Dependencies` -> Tap _Plus_. Insert url:

```
https://github.com/eladdekel/AlertKit
```

or adding it to the `dependencies` of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/eladdekel/AlertKit", .upToNextMajor(from: "5.1.8"))
]
```

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

### Liquid Glass (iOS 26+)

On iOS 26 and later, both `AlertAppleMusic16View` and `AlertAppleMusic17View` automatically upgrade their background to a tinted `UIGlassEffect`. On older iOS versions they fall back to the original blur material, so no caller changes are required.

If you want to opt out and force the classic blur on iOS 26+, pass `forceNonGlass: true` at construction time:

```swift
let alertView = AlertAppleMusic17View(title: "Added to Library", subtitle: nil, icon: .done, forceNonGlass: true)

// also available on the iOS 16 style
let alertView16 = AlertAppleMusic16View(title: "Added to Library", subtitle: nil, icon: .done, forceNonGlass: true)
```

The flag must be set at init — the background effect is built during initialisation, so a property change afterwards would have no effect.

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

## Disclaimer

This is a fork of sparrowcode's [AlertKit](https://github.com/sparrowcode/AlertKit) to support iOS 26's tinted glass. 