# TifoKit
A declarative UIKit for improve layout productivity when developing an iOS application

# Requirements
- Min. iOS 11
- Swift 5+
- 
# Installation
Currently only available via Swift Package Manager

# Example Usage
```
class ViewController: UIViewController, LayoutStackBehaviour {
    override func viewDidLoad() {
        super.viewDidLoad()
        VStack {
            HStack {
                UIView()
                    .setBackgroundColor(.black)
                UIView()
                    .setBackgroundColor(.purple)
                UIView()
                    .setBackgroundColor(.red)
            }
            .setDistribution(.fillEqually)
            .setSpacing(10)
            UIView()
                .setBackgroundColor(.blue)
            UIView()
                .setBackgroundColor(.yellow)
        }
        .setDistribution(.fillEqually)
        .setSpacing(10)
        .setHorizontalMargins(10)
    }
}
```
# License
TifoKit is released under the MIT license.
