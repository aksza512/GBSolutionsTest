//
//  GitHubRepository.swift
//  Test
//
//  Created by Alexa Márk on 2021. 09. 15..
//

import Foundation
import Resolver

class GitHubRepository {
	@Injected var gitHubApi: GitHubApiProtocol
	private var gitHubRepositoriesTask: URLSessionTask?
	private var gitHubRepositories: GitHubRepositories?
	private var gitHubRepositoryItems = [GitHubRepositoryModel]()
	private var page = 0
	private let pageSize = 30

	func fetchNextRepositoriesIfNeeded(searchText: String, _ completion: @escaping (_ result: ResultGitHubRepositories) -> Void) {
		guard gitHubRepositoriesTask == nil else { return }
		guard hasMorePage() else { return }
		incrementPage()
		gitHubRepositoriesTask = gitHubApi.gitHubRepositories(searchText: searchText, page: page, pageSize: pageSize) { [weak self] result in
			self?.gitHubRepositoriesTask = nil
			switch result {
			case .success(let nextRepositories):
				self?.gitHubRepositories = nextRepositories
				self?.gitHubRepositoryItems.append(contentsOf: nextRepositories.items)
				completion(.success(nextRepositories))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
	
	private func incrementPage() {
		page += 1
	}
	
	func hasMorePage() -> Bool {
		let totalCount = gitHubRepositories?.total_count ?? 0
		return (((page + 1) * pageSize) - totalCount) <= pageSize
	}
	
	func countOfGitHubRepositories() -> Int {
		gitHubRepositoryItems.count
	}
	
	func gitHubRepository(at index: Int) -> GitHubRepositoryModel? {
		gitHubRepositoryItems.safeAt(index)
	}
}
