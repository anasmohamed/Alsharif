//
//  AppDelegate.swift
//  Mashi
//
//  Created by no one on 12/01/2022.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UITabBar.appearance().unselectedItemTintColor = .white
        FirebaseApp.configure()
//        GMSServices.provideAPIKey(AppConfig.googleMapKey)


        GMSServices.provideAPIKey("AIzaSyB3IsJ2GZB1bw7UnG3W_JQrD_69zaSB3XQ")
        GMSPlacesClient.provideAPIKey(AppConfig.googlePlacesKey)
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

