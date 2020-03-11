# SPAlert

**Popup from Apple Music & Feedback in AppStore**. Contains `Done`, `Heart`, `Error` and other presets. Supports Dark Mode. I tried to recreate Apple's alerts as much as possible. You can find these alerts in the AppStore after feedback and after you add a song to your library in Apple Music.

<p float="left">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Preview%20-%20Done.gif" width="230">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Preview%20-%20Heart.gif" width="230">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Preview%20-%20Message.gif" width="230">
</p>

And more:

<p float="left">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Doc.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Bookmark.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Moon.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Star.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Flag.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Exclamation.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Question.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Message.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Bolt.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Eject.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Card.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Cart.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Like.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Dislike.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Privacy.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Rotate.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Search.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Add.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Error.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Shuffle.svg" width="50">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniature%20-%20Repeat.svg" width="50">
</p>

If you like the project, please do not forget to `star ★` this repository and follow me on GitHub. To help out with the project, see the [Сooperation](#сooperation) section.

For an example of this plugin in use, check this app: _Debts - Spending tracker_ for [iOS](https://itunes.apple.com/app/id1446635818) and [macOS](https://apps.apple.com/app/id1496914334). You can buy source code this apps in my store for iOS developers:

[![xcode-shop.com](https://github.com/ivanvorobei/SPPermissions/blob/master/Assets/Buttons/xcode-shop.svg)](https://xcode-shop.com)
[![https://github.com/ivanvorobei](https://github.com/ivanvorobei/SPPermissions/blob/master/Assets/Buttons/follow-me-on-github.svg)](https://github.com/ivanvorobei)

## Navigate

- [Requirements](#requirements)
- [Installation](#installation)
    - [CocoaPods](#cocoapods)
    - [Swift Package Manager](#swift-package-manager)
    - [Carthage](#carthage)
    - [Manually](#manually)
- [Quick Start](#quick-start)
- [Usage](#usage)
    - [Duration](#duration)
    - [Dark Mode](#dark-mode)
    - [Layout](#layout)
    - [Dismiss by Tap](#dismiss-by-tap)
    - [Haptic](#haptic)   
    - [Corner Radius](#corner-radius)
- [Сooperation](#сooperation)
- [License](#license)

## Requirements

Swift `4.2` & `5.0`. Ready for use on iOS 10+

## Installation

### CocoaPods:

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate `SPAlert` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SPAlert'
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate `SPAlert` into your Xcode project using Xcode 11, specify it in `File > Swift Packages > Add`:

```ogdl
https://github.com/ivanvorobei/SPAlert
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate `SPAlert` into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "ivanvorobei/SPAlert"
```

### Manually

If you prefer not to use any of dependency managers, you can integrate `SPAlert` into your project manually. Put `Source/SPAlert` folder in your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

## Quick Start

For best experience, I recommend presenting the alerts by calling the class functions on `SPAlert`. These functions are updated regularly and show the alerts "the Apple way". I focus on presets: 

```swift
SPAlert.present(title: "Added to Library", preset: .done)
```

For using a custom image:

```swift 
SPAlert.present(title: "Love", message: "We'll recommend more like this in For You", image: UIImage(named: "Heart")!)
```

For showing a simple text message:

```swift 
SPAlert.present(message: "Text!")
```

## Usage

If you require deep customization, this section will show you what you can do.

### Duration

If you want the `SPAlert` to be shwon longer, use the `duration` property:

```swift 
let alertView = SPAlertView(title: "Added to Library", message: nil, preset: SPAlertPreset.done)
alertView.duration = 3
alertView.present()
```

### Dark Mode

<img align="left" src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Preview%20-%20DarkMode.jpg" width="220">

Dark Mode needs no additional configuration. As soon as the user changes their interface to dark, all alerts will follow suit.

This is achieved by checking the `userInterfaceStyle` property on `traitCollection`.:

```swift
if self.traitCollection.userInterfaceStyle == .dark {
    return true
}
```

It is available since iOS 12, for earlier iOS versions the alerts will always be shown in Light Mode. 

### Layout

To change the size and spacing of the alerts:

```swift
alertView.layout.topSpace = 18
alertView.layout.iconHeight = 25
```

For more properties see the class.

### Dismiss by Tap

If you tap the alert, it will disappear ahead of time. This can be disabled:

```swift
alertView.dismissByTap = false
```

### Haptic

If you use presets, the vibro-response will be started automatically. To customize this, you need set the `haptic` property:

```swift
alertView.haptic = .success
```

To disable haptics, set it to `.none`.

### Corner Radius

You can change the corner radius by setting the `cornerRadius` property:

```swift
alertView.layer.cornerRadius = 40
```

## Сooperation

This project is free to use, but developing it takes time. Contributing to this project is a huge help. Here is list of tasks that need to be done:

- Add documentation in the source files (description of public methods and parameters). 
- Help me translate my app [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) for other languages. 

## License

`SPAlert` is released under the MIT license. Check `LICENSE.md` for details.
