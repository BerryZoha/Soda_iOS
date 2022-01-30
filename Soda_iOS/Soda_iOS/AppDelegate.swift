//
//  AppDelegate.swift
//  Soda_iOS
//
//  Created by 이유리 on 2022/01/29.
//

import KakaoSDKCommon
import KakaoSDKAuth
import GooglePlaces

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        KakaoSDK.initSDK(appKey: "4b84646f92e2d8a8bba6d1fd28dd0db8")
        GMSPlacesClient.provideAPIKey("AIzaSyBuMvwEha_ohDOIAOjebNDHxK6xICihFzA")
//        GMSServices.provideAPIKey("AIzaSyBuMvwEha_ohDOIAOjebNDHxK6xICihFzA")
        
        return true
    }
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

