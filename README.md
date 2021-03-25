# SPAlert

**Popup from Apple Music & Feedback in AppStore**. Contains `Done`, `Heart`, `Error` and other presets. Supports Dark Mode. I tried to recreate Apple's alerts as much as possible. You can find these alerts in the AppStore after feedback and after you add a song to your library in Apple Music.

<p float="left">
<img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Animatable/Done.gif" width="230">
<img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Animatable/Heart.gif" width="230">
<img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Animatable/Message.gif" width="230">
</p>

You can create more with custom images and [SFSymbols](https://developer.apple.com/sf-symbols/) more:

<p float="left">
<img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniatures/Bookmark.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniatures/Moon.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniatures/Star.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniatures/Exclamation.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniatures/Bolt.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniatures/Cart.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniatures/Like.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniatures/Dislike.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniatures/Privacy.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniatures/Search.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniatures/Add.svg" width="50">
<img src="https://github.com/ivanvorobei/SPAlert/blob/master/Assets/Readme/Miniatures/Error.svg" width="50">
</p>

If you like the project, don't forget to `put star ★` and follow me on GitHub:

[![https://github.com/ivanvorobei](https://github.com/ivanvorobei/Readme/blob/main/Buttons/follow-me-ivanvorobei.svg)](https://github.com/ivanvorobei)

## Migration to 3.0v

I did remove other presets becouse its UIImage symbols. Now you can do it with any symbols image. List of its you can get in [SF Symbols app](https://developer.apple.com/sf-symbols/). For get it, usage next:

```swift
// Create image from symbols
let image = UIImage.init(systemName: "pencil.and.outline")
// Create preset with custom image
let preset = SPAlertIconPreset.custom(image)
// Present `SPAlert`
SPAlert.present(title: "Title", message: "Message", preset: preset)
```

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
- [Other Projects](#other-projects)
- [Russian Community](#russian-community)

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate `SPAlert` into your Xcode project using Xcode 12, specify it in `File > Swift Packages > Add Package Dependency...`:

```ogdl
https://github.com/ivanvorobei/SPAlert
```

### CocoaPods:

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate `SPAlert` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SPAlert'
```

### Manually

If you prefer not to use any of dependency managers, you can integrate `SPAlert` into your project manually. Put `Sources/SPAlert` folder in your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

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

## Other Projects

#### [SPPermissions](https://github.com/ivanvorobei/SPPermissions)
Using for request and check state of permissions. Available native UI for request multiple permissions at the same time. Simple integration and usage like 2 lines code.

#### [SPPerspective](https://github.com/ivanvorobei/SPPerspective)
Animation of widgets from iOS 14. 3D transform with dynamic shadow. [Video preview](https://ivanvorobei.by/github/spperspective/video-preview). Available deep customisation 3D and shadow. Also you can use static transform without animation.

#### [SPDiffable](https://github.com/ivanvorobei/SPDiffable)
Simplifies working with animated changes in table and collections. Apple's diffable API required models for each object type. If you want use it in many place, you pass time to implement it and get over duplicates codes. This project help do it elegant with shared models and special cell providers. Support side bar iOS14 and already has native cell providers and views.

## Russian Community

В телеграм-канале [Код Воробья](https://sparrowcode.by/telegram) пишу о iOS разработке. Видео-туториалы выклыдываю на [YouTube](https://ivanvorobei.by/youtube):

[![Tutorials on YouTube](https://cdn.ivanvorobei.by/github/readme/youtube-preview.jpg)](https://ivanvorobei.by/youtube)
