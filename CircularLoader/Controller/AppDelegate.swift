//
//  AppDelegate.swift
//  CircularLoader
//
//  Created by Mattia Righetti on 2019-08-15.
//  Copyright © 2019 Mattia Righetti. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        let viewController = ViewController()

        window?.rootViewController = viewController

        return true
    }

}
