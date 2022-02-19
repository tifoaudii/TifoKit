# TifoKit
A declarative wrapper API to use UIKit for improve layout productivity when developing an iOS application

# Requirements
- Currently only support for iOS platform.
- Min. iOS 11
- Swift 5+

# Installation
Currently only available via Swift Package Manager

# Example Usage
TifoKit is now fully declarative, you are not required to use UIViewController anymore to building the UI.

You can simply create a new view by conform to the `HostingView` protocol.
```
struct HomeView: HostingView {
    var view: ContentView {
        VGroup {
            VGroup {
                View()
                    .backgroundColor(.brown)
                    .height(100)
                
                Label("First Label")
                Button(title: "Tap Me") {
                    print("tap me")
                }
                
                View()
                    .backgroundColor(.brown)
            }
            .setDistribution(.fill)
            
            
            View()
                .backgroundColor(.yellow)
            
            View()
                .backgroundColor(.blue)
        }
        .setSpacing(10)
        .setDistribution(.fillEqually)
    }
}
```

Like SwiftUI, you still need a view controller instance to host the View.
```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow()
    window?.makeKeyAndVisible()
    window?.rootViewController = UIComponentHostingViewController(hostingView: HomeView())
    return true
}
```
Currently TifoKit feature is still need a lot of development. For the UI components, we still need some of component like image, list, scroll view, etc. 
Give a star and follow my github to get update quickly.

# License
TifoKit is released under the MIT license.
