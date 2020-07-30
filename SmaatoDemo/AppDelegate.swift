//
//  AppDelegate.swift
//  SmaatoDemo
//
//  Created by Angelos Staboulis on 30/7/20.
//  Copyright © 2020 Angelos Staboulis. All rights reserved.
//

import UIKit
import SmaatoSDKCore
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
     
        guard let config = SMAConfiguration(publisherId: "1100042525") else {
                  fatalError("SDK config is nil!")
              }
              // allow HTTPS traffic only
              config.httpsOnly = true
              // log errors only
              config.logLevel = .error
              // ads content restriction based on age
              config.maxAdContentRating = .undefined
              
              SmaatoSDK.initSDK(withConfig:config)
              // allow the Smaato SDK to automatically get the user's location and put it inside the ad request
              SmaatoSDK.gpsEnabled = true
              
              // optional, specific configuration
              SmaatoSDK.userGender = .male // usually set after user logs in
              SmaatoSDK.userAge = 40 // usually set after user logs in
              SmaatoSDK.userSearchQuery = "bitcoin, lamborghini, san+francisco"
              UserDefaults.standard.set("0", forKey: "IABConsent_SubjectToGDPR")

        return false
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

