//
//  Api+Injection.swift
//  reapp
//
//  Created by Márk József Alexa on 2020. 09. 22..
//

import Resolver
import UIKit
import SwiftHelpers

extension Resolver {
	public static func registerApiServices() {
		// EndPoint
		register { Router<GitHubRepositoryEndPoint>(routerConfig: resolve(), logger: resolve()) }
		// API
		register { RouterConfig() }
		register { GitHubApi(router: resolve()) }
			.implements(GitHubApiProtocol.self)
	}
}
