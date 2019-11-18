//
//  AppDelegate.swift
//  TestAd
//
//  Created by Hs on 2019/11/7.
//  Copyright © 2019 swant. All rights reserved.
//

import UIKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window:UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.backgroundColor = UIColor.white
//        window?.rootViewController = TabBarViewController()
//        window?.makeKeyAndVisible()
        if #available(IOS 9, *){
            
        }else{
            
        }
        return true
    }


}

