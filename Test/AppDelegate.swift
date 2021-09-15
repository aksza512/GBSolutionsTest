//
//  AppDelegate.swift
//  Test
//
//  Created by Alexa Márk on 2021. 09. 15..
//

import UIKit
import Resolver

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let window = UIWindow(frame: UIScreen.main.bounds)
		self.window = window
		startInitWindow(window)
		return true
	}

	func startInitWindow(_ window: UIWindow) {
		let navigationHandler = Resolver.resolve(NavigationHandler.self)
		navigationHandler.start(window)
	}
}

