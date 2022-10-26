# BeHealthy

## Version history

| Version | Release date |
| - | - |
| 4.2.0 | May 9th, 2022 |
| 4.3.1 | Aug 29th,2022 |

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
# Crashlytics
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
# Crashlytics
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
https://github.com/g-behealthy/BeHealthy-iOS-Framework
```

<img width="1086" alt="e67c0bfd-87e7-40da-a874-fb37f95f77c0" src="https://user-images.githubusercontent.com/105304517/171743779-3f0916df-b3b9-49c6-bf5b-1368f08e7713.png">

After add package you should see it in your project navigator as a new dependency

<img width="480" alt="632f85c5-2576-499e-9961-94a433c2c0b0" src="https://user-images.githubusercontent.com/105304517/171743809-905ccdca-5bfc-48ae-9b3c-f8b9ae33e4ad.png">

### Install BeHealthy through Cocoapods

Add this line in Podfile, and execute a pod install through Terminal:

```
pod 'BeHealthy', :source => "https://github.com/g-behealthy/BeHealthy-iOS-Framework-Specs.git"
```


## Certificate configuration

In Apple Developer portal, when you create or edit your identifier you have to enable next capabilities:

- Associated Domains
- HealthKit
- Push Notifications



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

<img width="970" alt="4ef5aae2-7180-4256-a8b3-1fcf9c96ada0" src="https://user-images.githubusercontent.com/105304517/171743895-499b8020-6de9-49bb-aafb-5342d79cb38f.png">


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

<img width="651" alt="b1d1018e-9af3-4443-9501-2b2f2958e874" src="https://user-images.githubusercontent.com/105304517/171743918-e73fbdeb-e259-437e-955a-d24360b97e9f.png">


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

#### Swift

```
import BeHealthy

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let appDelegate = BeHealthyAppDelegate.instance
    
    ...
```

#### Objective C

```
#import <BeHealthy/BeHealthy-Swift.h>

@interface AppDelegate ()

@property (nonatomic, strong) BeHealthyAppDelegate *beHealthyAppDelegate;

@end

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.beHealthyAppDelegate = [BeHealthyAppDelegate instance];
    return YES;
}
```

didFinishLaunchingWithOptions method

#### Swift

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    appDelegate.application(application, didFinishLaunchingWithOptions: launchOptions)

    /*
    additional code if required
    */

    return true
}
```

#### Objective C

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.beHealthyAppDelegate = [BeHealthyAppDelegate instance];
    [self.beHealthyAppDelegate application:application didFinishLaunchingWithOptions:launchOptions];
    
    /*
    additional code if required
    */

    return YES;
}
```

applicationWillEnterForeground method

#### Swift

```
func applicationWillEnterForeground(_ application: UIApplication) {
    appDelegate.applicationWillEnterForeground(application)

    /*
    additional code if required
    */
}
```

#### Objective C

```
- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self.beHealthyAppDelegate applicationWillEnterForeground:application];
    
    /*
    additional code if required
    */
}
```

applicationDidEnterBackground method

#### Swift

```
func applicationDidEnterBackground(_ application: UIApplication) {
    appDelegate.applicationDidEnterBackground(application)

    /*
    additional code if required
    */
}
```

#### Objective C

```
- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.beHealthyAppDelegate applicationDidEnterBackground:application];
    
    /*
    additional code if required
    */
}
```

applicationDidBecomeActive method

#### Swift

```
func applicationDidBecomeActive(_ application: UIApplication) {
    appDelegate.applicationDidBecomeActive(application)

    /*
    additional code if required
    */
}
```

#### Objective C

```
- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self.beHealthyAppDelegate applicationDidBecomeActive:application];
    
    /*
    additional code if required
    */
}
```

applicationWillTerminate method

#### Swift

```
func applicationWillTerminate(_ application: UIApplication) {
    appDelegate.applicationWillTerminate(application)

    /*
    additional code if required
    */
}
```

#### Objective C

```
- (void)applicationWillTerminate:(UIApplication *)application {
    [self.beHealthyAppDelegate applicationWillTerminate:application];
    
    /*
    additional code if required
    */
}
```

URL handling related methods

#### Swift

```
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    /*
    additional code if required
    */

    return appDelegate.application(app, open: url, options: options)
}
```

#### Objective C

```
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    /*
    additional code if required
    */
    
    return [self.beHealthyAppDelegate application:app open:url options:options];
}
```
   
Remote notifications related methods

#### Swift

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

#### Objective C

```
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    /*
    additional code if required
    */
    
    [self.beHealthyAppDelegate application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    /*
    additional code if required
    */
    
    [self.beHealthyAppDelegate application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    /*
    additional code if required
    */
    
    [self.beHealthyAppDelegate application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}
```
    
Background processing related methods

#### Swift

```
func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
    /*  
    additional code if required
    */

    appDelegate.application(application, handleEventsForBackgroundURLSession: identifier, completionHandler: completionHandler)
}
```

#### Objective C

```
- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)(void))completionHandler {
    /*  
    additional code if required
    */
    
    [self.beHealthyAppDelegate application:application handleEventsForBackgroundURLSession:identifier completionHandler:completionHandler];
}
```

### Scene delegate

In scene delegate class create an instance of BeHealthySceneDelegate

#### Swift

```
import BeHealthy

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let sceneDelegate = BeHealthySceneDelegate.instance
    
    ...
}
```

#### Objective C

```
#import <BeHealthy/BeHealthy-Swift.h>

@interface SceneDelegate ()

@property (nonatomic, strong) BeHealthySceneDelegate *beHealthySceneDelegate;

@end

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.beHealthySceneDelegate = [BeHealthySceneDelegate instance];
}
```

sceneWillEnterForeground method

#### Swift

```
func sceneWillEnterForeground(_ scene: UIScene) {
    /*  
    additional code if required
    */
    
    sceneDelegate.sceneWillEnterForeground(scene)
}
```

#### Objective C

```
- (void)sceneWillEnterForeground:(UIScene *)scene {
    /*  
    additional code if required
    */
    
    [self.beHealthySceneDelegate sceneWillEnterForeground:scene];
}
```

sceneDidEnterBackground method

#### Swift

```
func sceneDidEnterBackground(_ scene: UIScene) {
    /*  
    additional code if required
    */
    
    sceneDelegate.sceneDidEnterBackground(scene)
}
```

#### Objective C

```
- (void)sceneDidEnterBackground:(UIScene *)scene {
    /*  
    additional code if required
    */
    
    [self.beHealthySceneDelegate sceneDidEnterBackground:scene];
}
```

### Enrollment

To enroll a new user to BeHealthy 

#### Swift

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

#### Objective C

```
#import <BeHealthy/BeHealthy-Swift.h>

@interface AppDelegate ()

@property (nonatomic, strong) BeHealthyConfig *beHealthyConfig;

@end
.
.
.
- (void)enrollUser {
    self.beHealthyConfig = [BeHealthyConfig instance];
    [self.beHealthyConfig removeCredentials];
    [self.beHealthyConfig setEmail:@"add user email here"];
    [self.beHealthyConfig setToken:@"add token here" completion:^{
        UIViewController *viewController = [self.beHealthyConfig enrollmentViewController];
        [self.window.rootViewController presentViewController:viewController animated:true completion:nil];
    }];
}
```

### Full access

To embed full content (login + progress + achievements) of BeHealthy framework

#### Swift

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

#### Objective C

```
#import <BeHealthy/BeHealthy-Swift.h>

@interface AppDelegate ()

@property (nonatomic, strong) BeHealthyConfig *beHealthyConfig;

@end
.
.
.
- (void)presentBeHealthy {
    self.beHealthyConfig = [BeHealthyConfig instance];
    [self.beHealthyConfig removeCredentials];
    UIViewController *viewController = [self.beHealthyConfig rootViewController];
    [self.window.rootViewController presentViewController:viewController animated:true completion:nil];
}
```

### Core access

To embed core content (progress + achievements) of BeHealthy framework

#### Swift

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

#### Objective C

```
#import <BeHealthy/BeHealthy-Swift.h>

@interface AppDelegate ()

@property (nonatomic, strong) BeHealthyConfig *beHealthyConfig;

@end
.
.
.
- (void)presentBeHealthy {
    self.beHealthyConfig = [BeHealthyConfig instance];
    [self.beHealthyConfig removeCredentials];
    UIViewController *viewController = [self.beHealthyConfig progressViewController];
    [self.window.rootViewController presentViewController:viewController animated:true completion:nil];
}
```

### Community configuration

You can set the community (this value is granted to you by BeHealthy team) before present the view controller

#### Swift

```
func presentBeHealthy() {
    beHealthyConfig.removeCredentials()
    beHealthyConfig.setCommunity("1")
    let viewController = beHealthyConfig.rootViewController()
    self.present(viewController, animated: true, completion: nil)
}
```

#### Objective C

```
- (void)presentBeHealthy {
    self.beHealthyConfig = [BeHealthyConfig instance];
    [self.beHealthyConfig removeCredentials];
    [self.beHealthyConfig setCommunity:@"1"];
    UIViewController *viewController = [self.beHealthyConfig rootViewController];
    [self.window.rootViewController presentViewController:viewController animated:true completion:nil];
}
```

### Branding

You can set primary, secondary and tertiary colors of your app's branding

#### Swift

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

#### Objective C

```
- (void)presentBeHealthy {
    self.beHealthyConfig = [BeHealthyConfig instance];
    [self.beHealthyConfig removeCredentials];
    [self.beHealthyConfig setColorsWithPrimaryColor:[UIColor redColor]
                                     secondaryColor:[UIColor blueColor]
                                      tertiaryColor:[UIColor greenColor]];
    UIViewController *viewController = [self.beHealthyConfig rootViewController];
    [self.window.rootViewController presentViewController:viewController animated:true completion:nil];
}
```

<img width="259" alt="75764854-40b7-433f-9517-431b4807fbba" src="https://user-images.githubusercontent.com/105304517/171743946-8f226e20-5677-44aa-949f-066943324829.png">


### Push notifications

In order to support BeHealthy push notifications you have to set device token

#### Swift

```
func presentBeHealthy() {
  beHealthyConfig.removeCredentials()
  beHealthyConfig.setDeviceToken(token: "add here the device token")
  .
  .
  .
}
```

#### Objective C

```
- (void)presentBeHealthy {
    self.beHealthyConfig = [BeHealthyConfig instance];
    [self.beHealthyConfig removeCredentials];
    [self.beHealthyConfig setDeviceTokenWithToken:@"add here the device token"];
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

<img width="287" alt="1b2f5d64-083e-41f3-9a5e-eec942d33028" src="https://user-images.githubusercontent.com/105304517/171743997-c765584c-99b6-4bf7-ab58-bd2cca191035.png">


### Troubleshooting

#### BeHealthy framework throws and error because my project can't recognize the framework

Try clean the project and build again

