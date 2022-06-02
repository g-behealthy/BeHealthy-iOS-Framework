# BeHealthy

## Version history

| Version | Release date |
| - | - |
| 4.2.0 | May 9th, 2022 |

## Requirements

* Minimum OS version: 13.0
* Designed for iPhone interface
* Supports only portrait orientation
* Supports only light mode

## How to install BeHealthy framework in your project

As a first step install Firebase framework in your project through Cocoapods, in case the project has already Cocoapods add this line to the podfile:

```
# Google Analytics
pod 'Firebase/Analytics'
# Crahslytics
pod 'Firebase/Crashlytics'
# Remote config
pod 'Firebase/RemoteConfig'
```

If the project hasn't Cocoapods yet add it through Terminal in the project root folder:

```
pod init
```

This command creates a file named **Podfile**, open it and add this text

```
# Google Analytics
pod 'Firebase/Analytics'
# Crahslytics
pod 'Firebase/Crashlytics'
# Remote config
pod 'Firebase/RemoteConfig'
```

In terminal run this command:

```
pod install
```

This command installs Firebase dependencies.


### Install BeHealthy through Swift Package Manager

In Xcode select File > Add Packages... and enter this URL 

```
https://github.globant.com/BeHealthy-Program/BeHealthy-iOS-Framework
```

<img width="1086" alt="Screen Shot 2022-04-26 at 7 23 14 PM" src="https://github.globant.com/storage/user/3245/files/e67c0bfd-87e7-40da-a874-fb37f95f77c0">

After add package you should see it in your project navigator as a new dependency

<img width="480" alt="Screen Shot 2022-03-11 at 3 56 12 PM" src="https://github.globant.com/storage/user/3245/files/632f85c5-2576-499e-9961-94a433c2c0b0">


### Install BeHealthy through Cocoapods

Add this line in Podfile, and execute a pod install through Terminal:

```
pod 'BeHealthy', :source => "https://github.globant.com/BeHealthy-Program/BeHealthy-iOS-Framework-Specs.git"
```


## Integrate framework in source code

### Signings and capabilities

Add next signings and capabilities:

* Associated domains:

```
applinks:admin.earnwith.watch
webcredentials:admin.earnwith.watch
```

* Background modes:

```
Background fetch
Remote notifications
```

* HealthKit with Background Delivery enabled
* Push Notifications

<img width="970" alt="Screen Shot 2022-03-16 at 5 28 17 PM" src="https://github.globant.com/storage/user/3245/files/4ef5aae2-7180-4256-a8b3-1fcf9c96ada0">


### Info.plist

Add next properties to Info.plist:

```
{Permitted background task scheduler identifiers: {Item 0 : com.behealthy.backgroundrefresh}}

{URL Types: 
  Item 0 (Viewer) :
    Document Role : View
    {URL Schemes :
      Item 0 : admin.earnwith.watch}
}
```

<img width="651" alt="Screen Shot 2022-03-18 at 9 27 29 AM" src="https://github.globant.com/storage/user/3245/files/b1d1018e-9af3-4443-9501-2b2f2958e874">

Also add next properties:

```
"NSCameraUsageDescription" = "Grant access to take a photo and upload it to the profile.";
"NSPhotoLibraryUsageDescription" = "Grant access to choose a profile picture from your Photos.";
"NSHealthShareUsageDescription" = "This information will be used by the application to recognize your physical activity and to track your progress toward program goals and rewards.";
"NSHealthUpdateUsageDescription" = "This information will be used by the application to recognize your physical activity and to track your progress toward program goals and rewards.";
"NSFaceIDUsageDescription" = "This app can use Face ID to confirm your identity. It is fast, easy and secure.";
"NSLocationWhenInUseUsageDescription" = "Grant access to get user current location";
```


### App delegate

In app delegate class create an instance of BeHealthyAppDelegate

```
import BeHealthy

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let appDelegate = BeHealthyAppDelegate.instance
    
    ...
```

didFinishLaunchingWithOptions method

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    appDelegate.application(application, didFinishLaunchingWithOptions: launchOptions)

    /*
    additional code if required
    */

    return true
}
```

applicationWillEnterForeground method

```
func applicationWillEnterForeground(_ application: UIApplication) {
    appDelegate.applicationWillEnterForeground(application)

    /*
    additional code if required
    */
}
```

applicationDidEnterBackground method

```
func applicationDidEnterBackground(_ application: UIApplication) {
    appDelegate.applicationDidEnterBackground(application)

    /*
    additional code if required
    */
}
```

applicationDidBecomeActive method

```
func applicationDidBecomeActive(_ application: UIApplication) {
    appDelegate.applicationDidBecomeActive(application)

    /*
    additional code if required
    */
}
```

applicationWillTerminate method

```
func applicationWillTerminate(_ application: UIApplication) {
    appDelegate.applicationWillTerminate(application)

    /*
    additional code if required
    */
}
```

URL handling related methods

```
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    /*
    additional code if required
    */

    return appDelegate.application(app, open: url, options: options)
}
```
   
Remote notifications related methods

```
func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    /*
    additional code if required
    */

    appDelegate.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
}

func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    /*
    additional code if required
    */

    appDelegate.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
}

func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    /*
    additional code if required
    */

    appDelegate.application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
}
```
    
Background processing related methods

```
func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
    /*  
    additional code if required
    */

    appDelegate.application(application, handleEventsForBackgroundURLSession: identifier, completionHandler: completionHandler)
}
```

### Scene delegate

In scene delegate class create an instance of BeHealthySceneDelegate

```
import BeHealthy

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let sceneDelegate = BeHealthySceneDelegate.instance
    
    ...
}
```

sceneWillEnterForeground method

```
func sceneWillEnterForeground(_ scene: UIScene) {
    /*  
    additional code if required
    */
    
    sceneDelegate.sceneWillEnterForeground(scene)
}
```

sceneDidEnterBackground method

```
func sceneDidEnterBackground(_ scene: UIScene) {
    /*  
    additional code if required
    */
    
    sceneDelegate.sceneDidEnterBackground(scene)
}
```

### Enrollment

To enroll a new user to BeHealthy 

```
import BeHealthy
.
.
.
let beHealthyConfig = BeHealthyConfig.instance
.
.
.
func enrollUser() {
    beHealthyConfig.removeCredentials()
    beHealthyConfig.setEmail("add user email here")
    beHealthyConfig.setEnrollToken("add token here") {
        let viewController = self.beHealthyConfig.enrollmentViewController()
        self.present(viewController,
                     animated: true,
                     completion: nil)
    }
}
```

### Full access

To embed full content (login + progress + achievements) of BeHealthy framework

```
import BeHealthy
.
.
.
let beHealthyConfig = BeHealthyConfig.instance
.
.
.
func presentBeHealthy() {
    beHealthyConfig.removeCredentials()
    let viewController = beHealthyConfig.rootViewController()
    self.present(viewController, animated: true, completion: nil)
}
```

### Core access

To embed core content (progress + achievements) of BeHealthy framework

```
import BeHealthy
.
.
.
let beHealthyConfig = BeHealthyConfig.instance
.
.
.
func presentBeHealthy() {
    beHealthyConfig.removeCredentials()
    let viewController = beHealthyConfig.progressViewController()
    self.present(viewController, animated: true, completion: nil)
}
```

### Community configuration

You can set the community (this value is granted to you by BeHealthy team) before present the view controller

```
func presentBeHealthy() {
    beHealthyConfig.removeCredentials()
    beHealthyConfig.setCommunity("1")
    let viewController = beHealthyConfig.rootViewController()
    self.present(viewController, animated: true, completion: nil)
}
```

### Branding

You can set primary, secondary and tertiary colors of your app's branding

```
func presentBeHealthy() {
    beHealthyConfig.removeCredentials()
    beHealthyConfig.setColors(primaryColor: UIColor.red,
                              secondaryColor: UIColor.blue,
                              tertiaryColor: UIColor.green)
    let viewController = beHealthyConfig.rootViewController()
    self.present(viewController, animated: true, completion: nil)
}
```

<img width="259" alt="Screen Shot 2022-04-06 at 4 38 49 PM" src="https://github.globant.com/storage/user/3245/files/75764854-40b7-433f-9517-431b4807fbba">

### Push notifications

In order to support BeHealthy push notifications you have to set device token

```
func presentBeHealthy() {
  beHealthyConfig.removeCredentials()
  beHealthyConfig.setDeviceToken(token: "add here the device token")
  .
  .
  .
}
```

### Multilanguage support

Framework supports these languages:

* English
* Spanish
* Portuguese

To add a specific language add localizable file to your project.

<img width="287" alt="Screen Shot 2022-03-11 at 4 24 15 PM" src="https://github.globant.com/storage/user/3245/files/1b2f5d64-083e-41f3-9a5e-eec942d33028">

### Troubleshooting

#### BeHealthy framework throws and error because my project can't recognize the framework

Try clean the project and build again

