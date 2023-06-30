# AlertKit

**Popup from Apple Music & Feedback in AppStore**. Contains `Done`, `Heart`, `Error` and other. Supports Dark Mode.
I tried to recreate Apple's alerts as much as possible. You can find these alerts in the AppStore after feedback and after you add a song to your library in Apple Music.

![Alert Kit v5](https://cdn.sparrowcode.io/github/alertkit/v5/preview-v1_2.png)

For run alert just call this:

```swift
AlertKitAPI.present(title: "Added to Library", icon: .done, style: .iOS17AppleMusic, haptic: .success)
```

Available 2 styles:

```swift
public enum AlertViewStyle {
    
    case iOS16AppleMusic
    case iOS17AppleMusic
}
```

### Community
    
<p float="left">
    <a href="https://twitter.com/sparrowcode_en">
        <img src="https://cdn.sparrowcode.io/github%2Fbadges%2Ftwitter.png?version=4" height="52">
    </a>
    <a href="https://t.me/sparrowcode_en">
        <img src="https://cdn.sparrowcode.io/github/badges/telegram.png?version=1" height="52">
    </a>
    <a href="https://mastodon.social/@sparrowcode_en">
        <img src="https://cdn.sparrowcode.io/github/badges/mastodon.png?version=2" height="52">
    </a>
    <a href="#apps-using">
        <img src="https://cdn.sparrowcode.io/github/badges/download-on-the-appstore.png?version=4" height="52">
    </a>
</p>

## Installation

Ready to use on iOS 13+.

### Swift Package Manager

In Xcode go to Project -> Your Project Name -> `Package Dependencies` -> Tap *Plus*. Insert url:

```
https://github.com/sparrowcode/AlertKit
```

or adding it to the `dependencies` of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/sparrowcode/AlertKit", .upToNextMajor(from: "5.0.0"))
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

## Apps Using

<p float="left">
    <a href="https://apps.apple.com/app/id1624477055"><img src="https://cdn.sparrowcode.io/github/apps-using/id1624477055.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id1625641322"><img src="https://cdn.sparrowcode.io/github/apps-using/id1625641322.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id875280793"><img src="https://cdn.sparrowcode.io/github/apps-using/id875280793.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id743843090"><img src="https://cdn.sparrowcode.io/github/apps-using/id743843090.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id537070378"><img src="https://cdn.sparrowcode.io/github/apps-using/id537070378.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id1570676244"><img src="https://cdn.sparrowcode.io/github/apps-using/id1570676244.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id1617055933"><img src="https://cdn.sparrowcode.io/github/apps-using/id1617055933.png?version=2" height="65"></a>
</p>

If you use a `SwiftBoost`, add your app via Pull Request.
