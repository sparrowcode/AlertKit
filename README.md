# SPAlert

**Popup from Apple Music & Feedback in AppStore**. Contains `Done`, `Heart`, `Error` and other presets. Supports Dark Mode. I tried to recreate Apple's alerts as much as possible. You can find these alerts in the AppStore after feedback and after you add a song to your library in Apple Music.

<p float="left">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Animatable/Done.gif" width="230">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Animatable/Heart.gif" width="230">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Animatable/Message.gif" width="230">
</p>

You can create more with custom images and [SFSymbols](https://developer.apple.com/sf-symbols/) more:

<p float="left">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Doc.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Bookmark.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Moon.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Star.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Flag.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Exclamation.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Question.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Message.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Bolt.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Eject.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Card.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Cart.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Like.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Dislike.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Privacy.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Rotate.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Search.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Add.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Error.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Shuffle.svg" width="50">
    <img src="https://github.com/varabeis/SPAlert/blob/master/Assets/Readme/Miniatures/Repeat.svg" width="50">
</p>

If you like the project, don't forget to `put star ★` and follow me on GitHub:

[![https://github.com/varabeis](https://github.com/varabeis/Assets/blob/master/Buttons/follow-me-on-github.svg)](https://github.com/varabeis)

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

## Other Projects

#### [SPPermissions](https://github.com/varabeis/SPPermissions)
Using for request and check state of permissions. Available native UI for request multiple permissions at the same time. Simple integration and usage like 2 lines code.

#### [SPPerspective](https://github.com/varabeis/SPPerspective)
Animation of widgets from iOS 14. 3D transform with dynamic shadow. [Video preview](https://cdn.ivanvorobei.by/github/SPPerspective/Preview.mov). Available deep customisation 3D and shadow. Also you can use static transform without animation.

#### [SPDiffable](https://github.com/varabeis/SPDiffable)
Simplifies working with animated changes in table and collections. Apple's diffable API required models for each object type. If you want use it in many place, you pass time to implement it and get over duplicates codes. This project help do it elegant with shared models and special cell providers. Support side bar iOS14 and already has native cell providers and views.

## Russian-specking Community

В телеграм-канале [Код Воробья](https://sparrowcode.by/telegram) пишу о iOS разработке и дизайне. Туториалы выклыдываю на [YouTube](https://sparrowcode.by/youtube):

[![Tutorials on YouTube](https://github.com/varabeis/Assets/blob/master/Russian%20Community/youtube-preview.jpg)](https://sparrowcode.by/youtube)
