# SPAlert

**Popup from Apple Music & Feedback in AppStore**. Contains `Done`, `Heart`, `Error` and other presets. Support Dark Mode. I clone Apple's alerts as much as possible. You can find this alerts in AppStore after feedback and after added song to library in Apple Music.

<p float="left">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Preview%20-%20Done.gif" width="230">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Preview%20-%20Heart.gif" width="230">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Preview%20-%20Message.gif" width="230">
</p>

And other

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

If you like the project, do not forget to `put star ★` and follow me on GitHub. To help project, see [Сooperation](#сooperation) section.

Check example usage in app _Debts - Spending tracker_ for [iOS](https://itunes.apple.com/app/id1446635818) and [macOS](https://apps.apple.com/app/id1496914334). You can buy source code this apps in my store for iOS developers:

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

For best experience, I recommend call alerts by `SPAlert`. These functions are updated regularly and show as Apple way. I focus on presets: 

```swift
SPAlert.present(title: "Added to Library", preset: .done)
```

If you want use custom image, use func:

```swift 
SPAlert.present(title: "Love", message: "We'll recommend more like this in For You", image: UIImage(named: "Heart")!)
```

For show simple text message, use:

```swift 
SPAlert.present(message: "Empty UITextField")
```

## Usage

Sometimes it may require deep customization. In this section, I will show you what you can do.

### Duration

To change the time that the `SPAlert` will be shown, use property `duration`:

```swift 
let alertView = SPAlertView(title: "Added to Library", message: nil, preset: SPAlertPreset.done)
alertView.duration = 3
alertView.present()
```

### Dark Mode

<img align="left" src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Preview%20-%20DarkMode.jpg" width="220">

Dark Mode no need additional configuration. As soon as the user change the interface to dark, all alerts will appear dark.

For check state of user appearance I am use `traitCollection`:

```swift
if self.traitCollection.userInterfaceStyle == .dark {
    return true
}
```

It available since iOS 12, for early using always Light Mode. 

### Layout

Here you can change the sizes and spaces:

```swift
alertView.layout.topSpace = 18
alertView.layout.iconHeight = 25
```

For more properties see class.

### Dismiss by Tap

If you click on the alert, it will disappear ahead of time. This can be disabled:

```swift
alertView.dismissByTap = false
```

### Haptic

If you use presets, the vibro-response will be start automatically. For customize this, you need set property `haptic`:

```swift
alertView.haptic = .success
```

For disable haptic, set it to `.none`.

### Corner Radius

I use a corner radius like an Apple. If you need to change it, see the property `cornerRadius`: 

```swift
alertView.layer.cornerRadius = 40
```

## Сooperation

The development of this project is completely free. If you can make a contribution, it will help development. Here list of task what need do:

- Fix mistakes in this Readme and docs. My English so bad. Good create pull request.
- Add docs in source files. Description of public methods and parametrs. 
- Help me translate my app [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) for other languages. 

## License

`SPAlert` is released under the MIT license. Check `LICENSE.md` for details.
