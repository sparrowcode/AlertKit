# SPAlert

**Popup from Apple Music & Feedback in AppStore**. Contains `Done` & `Heart` presets. `Done` preset present with animation. I clone Apple's alerts as much as possible. You can find this alerts in AppStore after feedback, after added song to library in Apple Music. I am also add alert without icon, as simple message.

<p float="left">
    <img src="https://github.com/IvanVorobei/SPAlert/blob/master/Resources/Preview-Done.gif" width="250">
    <img src="https://github.com/IvanVorobei/SPAlert/blob/master/Resources/Preview-Heart.gif" width="250">
    <img src="https://github.com/IvanVorobei/SPAlert/blob/master/Resources/Preview-Message.gif" width="250">
</p>

 You can download example app [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) from AppStore. If you like the project, do not forget to **put star ★** or donate:

[![Patron](https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Patron%20Button.svg)](https://patreon.com/ivanvorobei)

<p>See project's backers in <a href="https://github.com/IvanVorobei/SPPermission#sponsors">Sponsors</a> section.</p>

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
- [Sponsors](#sponsors)
- [Other Projects +gif](#my-projects)
	- [SPStorkController](#spstorkcontroller)
    - [SPLarkController](#splarkcontroller)
    - [SPPermission](#sppermission)
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

## Sponsors

Support me with a monthly donation and help me continue activities: [Become a sponsors](https://www.patreon.com/ivanvorobei)

<a href="https://github.com/zubara21/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/zubara21.jpg" width="100"></a>
<a href="https://github.com/sparrowganz/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/sparrowganz.jpg" width="100"></a>

## My projects

<p float="left">
    <img align="left" src="https://github.com/IvanVorobei/SPStorkController/blob/master/Resources/Preview.gif" width="220"/>
</p>

### SPStorkController

<p><a href="https://github.com/IvanVorobei/SPStorkController" target="_blank">SPStorkController</a> is transition controller <b>as in Apple Music, Podcasts and Mail</b> apps. Customizable height. Simple adding close button and centering arrow indicator. Check scroll's bounce for more interactive. Simple adding close button and centering arrow indicator. You can download example <a href="https://itunes.apple.com/app/id1446635818">Debts - Spending tracker</a> app from AppStore.<br><br>
Alert you can find in <a href="https://github.com/IvanVorobei/SPAlert">SPAlert</a> project. If you want to <b>buy source code</b> of app in preview, please, go to <a href="https://xcode-shop.com">xcode-shop.com</a>.</p>

---

<p float="left">
    <img align="left" src="https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Preview.gif" width="220"/>
</p>

### SPPermission

<p><a href="https://github.com/IvanVorobei/SPPermission" target="_blank">SPPermission</a> allow request permissions <b>with native dialog</b> UI and interactive animations. Also you can request permissions without dialog. Check state any permission. You can start using this project with just two lines of code and easy customisation.
<br><br>
If your app uses SPPermission, write me. I am adding you app as example of usage.

---

<p float="left">
    <img align="left" src="https://github.com/IvanVorobei/SPLarkController/blob/master/Resources/Preview.gif" width="220"/>
</p>

### SPLarkController

<p><a href="https://github.com/IvanVorobei/SPLarkController" target="_blank">SPLarkController</a> make <b>settings screen</b> for application. You can add <b>buttons and switches</b>. The amount cells is not limited. You can start using project with just two lines of code and easy customisation. For implement settings as in preiew, see section <a href="https://github.com/IvanVorobei/SPLarkController#settings-controller">Settings Controller</a>.<br><br>
You can download example app <a href="https://itunes.apple.com/app/id1453325619" target="_blank">Code - Learn Swift & Design</a> from AppStore. If you want to <b>buy source code</b> of app this app, please, go to <a href="https://xcode-shop.com" target="_blank">xcode-shop.com</a><p>

---

## License
`SPAlert` is released under the MIT license. Check `LICENSE.md` for details.

## Contact
If you need any application or UI to be developed, message me at hello@ivanvorobei.by or via [telegram](https://t.me/ivanvorobei). I develop iOS apps and designs. I use `swift` for development. To request more functionality, you should create a new issue. You can see my [apps in AppStore](https://itunes.apple.com/developer/id1446635817).
