# SPAlert

**Popup from Apple Music & Feedback in AppStore**. Contains `Done`, `Heart`, `Error` and other presets. Supports Dark Mode. I tried to recreate Apple's alerts as much as possible. You can find these alerts in the AppStore after feedback and after you add a song to your library in Apple Music. Support `SwiftUI`.

<p float="left">
<img src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/Animatable/Done.gif" width="230">
<img src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/Animatable/Heart.gif" width="230">
<img src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/Animatable/Message.gif" width="230">
</p>

You can create more with custom images and [SFSymbols](https://developer.apple.com/sf-symbols/) more:

<p float="left">
<img src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/Miniatures/Bookmark.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/Miniatures/Moon.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/Miniatures/Star.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/Miniatures/Exclamation.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/Miniatures/Bolt.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/Miniatures/Cart.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/Miniatures/Like.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/Miniatures/Dislike.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/Miniatures/Privacy.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/Miniatures/Search.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/Miniatures/Add.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/Miniatures/Error.svg" width="50">
</p>

If you like the project, don't forget to `put star ★`<br>Check out my other libraries:

<p float="left">
    <a href="https://opensource.ivanvorobei.by">
        <img src="https://github.com/ivanvorobei/Readme/blob/main/Buttons/more-libraries.svg">
    </a>
</p>

## Navigate

- [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
    - [CocoaPods](#cocoapods)
    - [Manually](#manually)
- [Quick Start](#quick-start)
- [Usage](#usage)
    - [Duration](#duration)
    - [Layout](#layout)
    - [Dismiss by Tap](#dismiss-by-tap)
    - [Haptic](#haptic)
    - [Shared Configuration](#shared-configuration)
- [SwiftUI](#swiftui)
- [Other Projects](#other-projects)
- [Russian Community](#russian-community)

## Installation

Ready for use on iOS 11+. Works with Swift 5+. Required Xcode 12.0 and higher.

<img align="right" src="https://github.com/ivanvorobei/SPAlert/blob/main/Assets/Readme/spm-install-preview.png" width="520"/>

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate using Xcode 12, specify it in `File > Swift Packages > Add Package Dependency...`:

```ogdl
https://github.com/ivanvorobei/SPAlert
```

### CocoaPods:

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SPAlert'
```

### Manually

If you prefer not to use any of dependency managers, you can integrate manually. Put `Sources/ProjectName` folder in your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

## Quick Start

For best experience, I recommend presenting alerts by calling the class functions `SPAlert`. These functions are updated regularly and show the alerts as Apple way: 

```swift
SPAlert.present(title: "Added to Library", preset: .done)
```

For using a custom image:

```swift 
SPAlert.present(title: "Love", message: "We'll recommend more like this in For You", preset: .custom(UIImage.init(named: "heart")!))
```

For showing a simple text message:

```swift 
SPAlert.present(message: "Something going wrong", haptic: .error)
```

## Usage

### Duration

For change duration of present time, create alert view and call `present` method with custom duration:

```swift
let alertView = SPAlertView(title: "Complete", preset: .done)
alertView.present(duration: 3)
```

### Layout

For customise layout and margins, use `layout` property. You can manage margins for each side, icon size and space between image and titles:

```swift
alertView.layout.iconSize = .init(width: 24, height: 24)
alertView.layout.margins.top = 12
alertView.layout.spaceBetweenIconAndTitle = 8
```

### Dismiss by Tap

If you tap the alert, it will disappear. This can be disabled:

```swift
alertView.dismissByTap = false
```
### Haptic

For manage haptic, you shoud pass it in present method:

```swift
alertView.present(duration: 1.5, haptic: .success, completion: nil)
```

You can remove duration and completion, its have default values.

### Shared Configuration

Also you can change some default values for alerts. For example you can change default duration and corner radius for alert with next code:

```swift
SPAlertConfiguration.duration = 2
SPAlertConfiguration.cornerRadius = 12
```

It will apply for all alerts. Shoud set configuration before present any alerts. I recomend set it in app delegate.

## SwiftUI

Use like system alert only show message tips:

```swift
Button("Show alert") {
    showAlert = true
}.spAlert(isPresent: $showAlert, message: "this is message only")
```

or show message, title, image and other configuration:

```swift
Button("Show alert") {
    showAlert = true
}.spAlert(isPresent: $showAlert, 
        title: "Alert title", 
        message: "Alert message",
        duration: 2.0, 
        dismissOnTap: false, 
        present: .custom(UIImage(systemName: "heart")!), 
        haptic: .success, 
        layout: .init(), 
        completion: {
            print("Alert is destory")
        })
```

## Other Projects

I love being helpful. Here I have provided a list of libraries that I keep up to date. For see `video previews` of libraries without install open [opensource.ivanvorobei.by](https://opensource.ivanvorobei.by) website.<br>
I have libraries with native interface and managing permissions. Also available pack of useful extensions for boost your development process.

<p float="left">
    <a href="https://opensource.ivanvorobei.by">
        <img src="https://github.com/ivanvorobei/Readme/blob/main/Buttons/more-libraries.svg">
    </a>
</p>

## Russian Community

Подписывайся в телеграмм-канал, если хочешь получать уведомления о новых туториалах.<br>
Со сложными и непонятными задачами помогут в чате.

<p float="left">
    <a href="https://sparrowcode.by/telegram/channel">
        <img src="https://github.com/ivanvorobei/Readme/blob/main/Buttons/russian-community-tutorials.svg">
    </a>
    <a href="https://sparrowcode.by/telegram/libs">
        <img src="https://github.com/ivanvorobei/Readme/blob/main/Buttons/russian-community-libraries.svg">
    </a>
    <a href="https://sparrowcode.by/telegram/chat">
        <img src="https://github.com/ivanvorobei/Readme/blob/main/Buttons/russian-community-chat.svg">
    </a>
</p>

Видео-туториалы выклыдываю на [YouTube](https://sparrowcode.by/youtube):

[![Tutorials on YouTube](https://cdn.ivanvorobei.by/github/readme/youtube-preview.jpg)](https://sparrowcode.by/youtube)
