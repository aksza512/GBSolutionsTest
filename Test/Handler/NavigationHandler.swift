//
//  NavigationHandler.swift
//  Timeline
//
//  Created by Alexa Márk on 2021. 08. 27..
//

import UIKit
import Resolver
import SwiftHelpers

class NavigationHandler {
	
	func start(_ window: UIWindow) {
		let initViewController = Resolver.main.resolve(RepositorySearchViewController.self)
		guard let window = (UIApplication.shared.delegate as? AppDelegate)?.window else { return }
		window.rootViewController = BNavigationViewController(rootViewController: initViewController)
		window.makeKeyAndVisible()
	}
	
}
