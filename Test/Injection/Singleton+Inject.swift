//
//  Storyboard+Injection.swift
//  reapp
//
//  Created by Márk József Alexa on 2020. 09. 21..
//

import Resolver
import UIKit
import SwiftHelpers

extension Resolver {
	public static func registerSingletonServices() {
		// Repository
		register { GitHubRepository() }
		
		// Application
		register { NavigationHandler() }.scope(.application)
		register { AppLogger() }
			.implements(LoggerProtocol.self).scope(.application)
	}
}
