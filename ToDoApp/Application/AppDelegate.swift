//
//  AppDelegate.swift
//  ToDoApp
//
//  Created by Ali Raza on 01/07/2024.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController  = UINavigationController(rootViewController: SplashController())
        window?.makeKeyAndVisible()
        return true
    }
}
