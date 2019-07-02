# SPAlert

**Popup from Apple Music & Feedback in AppStore**. Contains `Done` & `Heart` presets. `Done` preset present with animation. Also support Dark Mode. I clone Apple's alerts as much as possible. You can find this alerts in AppStore after feedback, after added song to library in Apple Music.

<p float="left">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Resources/Preview-Done.gif" width="250">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Resources/Preview-Heart.gif" width="250">
    <img src="https://github.com/ivanvorobei/SPAlert/blob/master/Resources/Preview-Message.gif" width="250">
</p>

You can download example [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) app from AppStore.  
For **buy source code** of app in preview, go to:

[![xcode-shop.com](https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Buttons/Xcode%20Shop%20Button%20-%203.svg)](https://xcode-shop.com)

See project's backers in [Sponsors](https://github.com/ivanvorobei/SPAlert#sponsors) section.

## Navigate

- [Requirements](#requirements)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Usage](#usage)
    - [Duration](#duration)
    - [Dark Mode](#dark-mode)
    - [Layout](#layout)
    - [Dismiss by Tap](#dismiss-by-tap)
    - [Haptic](#haptic)   
    - [Corner Radius](#corner-radius)
- [Required Presets](#required-presets)
- [Sponsors](#sponsors)
- [Other Projects +gif](#my-projects)
	- [SPStorkController](#spstorkcontroller)
    - [SPLarkController](#splarkcontroller)
    - [SPPermission](#sppermission)
    - [Awesome iOS UI](https://github.com/ivanvorobei/awesome-ios-ui)
    - [SwiftUI Examples](https://github.com/ivanvorobei/SwiftUI)
- [License](#license)

## Requirements

Swift `4.2` & `5.0`. Ready for use on iOS 10+

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

Currently there are few presets. If you want **to add a new preset**, create a [issue](https://github.com/ivanvorobei/SPAlert/issues) and describe how you see it. I will try to quickly add new presets.


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

<img align="left" src="https://github.com/ivanvorobei/SPAlert/blob/master/Resources/Dark-Mode-Preview.jpg" width="220">

The default mode is `Dark Mode`. No additional configuration is required. As soon as the user change the interface to dark, all alerts will appear dark.

For check state of user appearance I am use `traitCollection`:

```swift
if self.traitCollection.userInterfaceStyle == .dark {
    return true
}
```

It available sice iOS 12, for early using always Light Mode. 

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

## Required Presets

I will add new types and presets as needed. I will add animation and custom layout to them for a better experience. To know what presets need to be done, please inform me. You do not need to be shy. Make a new [issue](https://github.com/ivanvorobei/SPAlert/issues) and describe what kind of graphics or animation you would like. I will try to quickly add new items.

## Sponsors

Support me with a monthly donation and help me continue activities. After payment I add you to list of sponsor **in my all projects** with link to your profile. [Become a sponsors](https://www.patreon.com/ivanvorobei)

<a href="https://github.com/zubara21/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/zubara21.jpg" width="100"></a>
<a href="https://github.com/sparrowganz/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/sparrowganz.jpg" width="100"></a>
<a href="https://github.com/shatk0vskiy/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/shatk0vskiy.jpg" width="100"></a>
<a href="https://www.patreon.com/ivanvorobei" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/add.jpg" width="100"></a>

## My projects

<img align="left" src="https://github.com/ivanvorobei/SPStorkController/blob/master/Resources/Preview.gif" width="220"/>

### SPStorkController

[SPStorkController](https://github.com/ivanvorobei/SPStorkController) is сontroller **as in Apple Music, Podcasts and Mail** apps. Simple adding close button and centering arrow indicator. Customizable height. Using custom TransitionDelegate. Check scroll's bounce for more interactive. Simple adding close button and centering arrow indicator. You can download example [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) app from AppStore.

Alert you can find in [SPAlert](https://github.com/ivanvorobei/SPAlert) project. If you want to **buy source code** of app in preview, please, go to [xcode-shop.com](https://xcode-shop.com)

---

<img align="left" src="https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Preview.gif" width="220"/>

### SPPermission

[SPPermission](https://github.com/ivanvorobei/SPPermission) allow request permissions **with native dialog** UI and interactive animations. Also you can request permissions without dialog. Check state any permission. You can start using this project with just two lines of code and easy customisation.

You can buy example Dialog & Dinamic animations in [xcode-shop.com](https://xcode-shop.com/ui-elements), see [preview](https://xcode-shop.com/assets/preview/dinamic-alert.mov).

---

<img align="left" src="https://github.com/ivanvorobei/SPLarkController/blob/master/Resources/Preview.gif" width="220"/>

### SPLarkController

[SPLarkController](https://github.com/ivanvorobei/SPLarkController) transition between controllers. Translate to top. Make **settings screen** for application. You can add **buttons and switches**. The amount cells is not limited. You can start using project with just two lines of code and easy customisation. For implement settings as in preiew, see section [Settings Controller](https://github.com/ivanvorobei/SPLarkController#settings-controller).

You can download example app [Code - Learn Swift & Design](https://itunes.apple.com/app/id1453325619) from AppStore. If you want to **buy source code** of app this app, please, go to [xcode-shop.com](https://xcode-shop.com).

## License

`SPAlert` is released under the MIT license. Check `LICENSE.md` for details.
