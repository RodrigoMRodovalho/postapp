# PostApp

PostApp is a iPhone/iPad app that presents post and comments from DummyAPI (https://dummyapi.io/).

# PostApp Scope

  -  Post List Screen that presents information throght a infinite list fetching new information after reaching bottom of screen.
  - Comment Screen presents comments of a specific Post after a selection in Post List Screen

# Features

  - iPhone and iPad support
  - Infinite Fetching Data for Posts and Comments
  - Dark Mode Support
  - Multi lanugage support - EN, PT-BR, ES
  - Multi Screen and Multi Orientation Support

# Technical Stack

PostApp is built using Swift and iOS SDK.

  - PostApp follow the Clean Architecture and MVVM pattern in Presentation Layer
  - Layers intergration and asyncronous operations is structure upon RxSwift (https://github.com/ReactiveX/RxSwift) 
  - Dependency Injection is made upon Swinject (https://github.com/Swinject/Swinject)
  - Image Downloading is made using Kingfisher (https://github.com/onevcat/Kingfisher)
  - To present tags list with styled view was used TagListView (https://github.com/ElaWorkshop/TagListView)
  - To generate string resource reference and avoid using string directly was used SwiftGen (https://github.com/SwiftGen/SwiftGen)
  - To generate mock for unit tests Cuckoo (https://github.com/Brightify/Cuckoo) was used.
  - Keys (API keys) stored avoiding hardcoding in project using plugin CocoaPods-Keys (https://github.com/orta/cocoapods-keys)
 
> Third-Party Dependencies are obtained via CocoaPods.

# Quality

PostApp project contains Unit Tests and UI Tests

| Unit Tests | UI Tests
:-:|:-:
![alt text](https://github.com/RodrigoMRodovalho/postapp/blob/main/Screenshots/UnitTests.png) | building

### Installation

Before open in Xcode we need to do some installation steps, go to project root folder using terminal

To install cocoapods-keys, run:

```sh
$ gem install cocoapods-keys
```

After to install dependencies, run:

```sh
$ pod install
```

When running this command, the keys will be prompted, so insert the AppId registered in DummyAPi (https://dummyapi.io/)

## Execution

As we are using CocoaPods, open **PostsApp.xcworkspace** using Xcode

### Screenshots

![alt text](https://github.com/RodrigoMRodovalho/postapp/blob/main/Screenshots/iPhonePosts.png)

![alt text](https://github.com/RodrigoMRodovalho/postapp/blob/main/Screenshots/iPhoneComments.png)

![alt text](https://github.com/RodrigoMRodovalho/postapp/blob/main/Screenshots/iPad.png)

License
----
MIT
