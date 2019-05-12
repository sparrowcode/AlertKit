# SPAlert

**Popup from Apple Music & Feedback in AppStore**. Contains `Done` & `Heart` presets. `Done` preset present with animation. I clone Apple's alerts as much as possible. You can download example app [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) from AppStore. If you like the project, do not forget to **put star ★**

### Preview

<p float="left">
 	<img src="https://github.com/IvanVorobei/SPAlert/blob/master/Resources/Preview-Done.gif" width="250">
	<img src="https://github.com/IvanVorobei/SPAlert/blob/master/Resources/Preview-Heart.gif" width="250">
	<img src="https://github.com/IvanVorobei/SPAlert/blob/master/Resources/Preview-Message.gif" width="250">
</p>

If you want to **buy source code** of example apps, please, go to [xcode-shop.com](https://xcode-shop.com).

## Navigate

- [Requirements](#requirements)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Usage](#usage)
    - [Duration](#duration)
    - [Layout](#layout)
    - [Dismiss by Tap](#dismiss-by-tap)
    - [Haptic](#haptic)   
    - [Corner Radius](#corner-radius)
- [Required Presets](#required-presets)
- [Other Projects +gif](#my-projects)
	- [SPStorkController](#spstorkcontroller)
    - [SPLarkController](#splarkcontroller)
    - [SPPermission](#sppermission)
    - [Xcode Shop](#xcode-shop)
- [License](#license)
- [Contact or Order Develop](#contact)

## Requirements

Swift 4.2 & **5.0**. Ready for use on iOS 10+

## Installation

### CocoaPods:

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate `SPAlert` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SPAlert'
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate `SPAlert` into your project manually. Put `Source/SPAlert` folder in your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

## Quick Start

For best experience, I recommend call alerts by `SPAlert`. These functions are updated regularly and show as Apple way. I focus on presets: 

```swift
SPAlert.present(title: "Added to Library", preset: .done)
```

Currently there are few presets. If you want **to add a new preset**, create a [issue](https://github.com/IvanVorobei/SPAlert/issues) and describe how you see it. I will try to quickly add new presets.


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
alertView.cornerRadius = 12
```

## Required Presets

I will add new types and presets as needed. I will add animation and custom layout to them for a better experience. To know what presets need to be done, please inform me. You do not need to be shy. Make a new [issue](https://github.com/IvanVorobei/SPAlert/issues) and describe what kind of graphics or animation you would like. I will try to quickly add new items.

## My projects

### SPStorkController

[SPStorkController](https://github.com/IvanVorobei/SPStorkController) is very similar to the modal **controller displayed in Apple Music, Podcasts and Mail** apps. Customizable height of view. Check scroll's bounce for more interactive. Simple adding close button and centering arrow indicator. You can download example [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) app from AppStore.

<img src="https://github.com/IvanVorobei/SPStorkController/blob/master/Resources/Preview.gif" width="440">

If you want to **buy source code** of this apps, please, go to [xcode-shop.com](https://xcode-shop.com).

### SPPermission

[SPPermission](https://github.com/IvanVorobei/SPPermission) allow request permissions **with native dialog** UI and interactive animations. Also you can request permissions without dialog. Check state any permission. You can start using this project with just two lines of code and easy customisation. 

<img src="https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Preview.gif" width="500">

### SPLarkController

[SPLarkController](https://github.com/IvanVorobei/SPLarkController) make **settings screen** for your application. You can add **buttons and switches**. The amount cells is not limited. You can start using project with just two lines of code and easy customisation.

<img src="https://github.com/IvanVorobei/SPLarkController/blob/master/Resources/Preview.gif" width="440">

You can download [Code - Learn Swift & Design](https://itunes.apple.com/app/id1453325619) app, which uses `SPLarkController`. Also you can **buy source code** of this app on [xcode-shop.com](https://xcode-shop.com).

### Xcode Shop

If you want **buy apps with source code**, you can visit my [xcode-shop.com](https://xcode-shop.com). Here I am sale apps, modules, 3D elements and other. In applications you can find many cool UI that will be useful for your projects. Also by buying, **you support me** and my free GitHub development.

## License
`SPAlert` is released under the MIT license. Check `LICENSE.md` for details.

## Contact
If you need any application or UI to be developed, message me at hello@ivanvorobei.by or via [telegram](https://t.me/ivanvorobei). I develop iOS apps and designs. I use `swift` for development. To request more functionality, you should create a new issue. You can see my [apps in AppStore](https://itunes.apple.com/developer/id1446635817).
