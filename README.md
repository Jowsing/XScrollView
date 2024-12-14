# XScrollView

[![CI Status](https://img.shields.io/travis/jowsing/XScrollView.svg?style=flat)](https://travis-ci.org/jowsing/XScrollView)
[![Version](https://img.shields.io/cocoapods/v/XScrollView.svg?style=flat)](https://cocoapods.org/pods/XScrollView)
[![License](https://img.shields.io/cocoapods/l/XScrollView.svg?style=flat)](https://cocoapods.org/pods/XScrollView)
[![Platform](https://img.shields.io/cocoapods/p/XScrollView.svg?style=flat)](https://cocoapods.org/pods/XScrollView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Screencast from our Demo

<img src="https://github.com/Jowsing/XScrollView/blob/main/images/vertical.gif" width="40%"/>

### Usage

Init XScrollView

```swift
        let scrollView = XScrollView(frame: .zero)
        scrollView.backgroundColor = .red
        scrollView.contentInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            if #available(iOS 11.0, *) {
                make.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            } else {
                // Fallback on earlier versions
            }
        }
```

Automatic layout of directions

```swift
        // Set the auto scroll direction
        scrollView.autoScrollDirection = .vertical // or horizontal
```

Add Subviews

```swift
        // Add the views
        scrollView.addArrangedSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(15)
        }
        
        scrollView.addArrangedSubview(label)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.left.right.equalTo(0)
        }
```


## Requirements

## Installation

XScrollView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XScrollView'
```

## Author

jowsing, jowsing169@gmail.com

## License

XScrollView is available under the MIT license. See the LICENSE file for more info.
