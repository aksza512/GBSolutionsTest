//
//  GitHubApi.swift
//  Test
//
//  Created by Alexa Márk on 2021. 09. 15..
//

import Foundation
import SwiftHelpers
import Resolver

typealias ResultGitHubRepositories = Result<GitHubRepositories, NetworkError>

protocol GitHubApiProtocol {
	@discardableResult func gitHubRepositories(searchText: String, page: Int, pageSize: Int, _ completion: @escaping (_ result: ResultGitHubRepositories) -> Void) -> URLSessionTask?
}

class GitHubApi: GitHubApiProtocol {
	let router: Router<GitHubRepositoryEndPoint>

	init(router: Router<GitHubRepositoryEndPoint>) {
		self.router = router
	}

	func gitHubRepositories(searchText: String, page: Int, pageSize: Int, _ completion: @escaping (_ result: ResultGitHubRepositories) -> Void) -> URLSessionTask? {
		router.request(.repositories(searchText, page: page, pageSize: pageSize)) { (tmpResult: ResultGitHubRepositories) in
			completion(tmpResult)
		}
	}

}
