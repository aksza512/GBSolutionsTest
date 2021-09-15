//
//  AppDelegate+Injection.swift
//  reapp
//
//  Created by Márk József Alexa on 2020. 09. 21..
//

import Resolver

extension StoryboardResolving {
	var mainResolver: Resolver { Resolver(parent: .main) }
}

extension Resolver: ResolverRegistering {
	public static func registerAllServices() {
		registerApiServices()
		registerSingletonServices()
		registerViewControllers()
	}
}
