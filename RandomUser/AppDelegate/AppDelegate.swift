//
//  AppDelegate.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 08/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = .systemBackground
    window?.rootViewController = UINavigationController(rootViewController: UserGeneratorViewController())
    return true
  }

}

