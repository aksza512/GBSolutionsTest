//
//  RepositoryListPresenter.swift
//  Test
//
//  Created by Alexa Márk on 2021. 09. 15..
//

import Foundation
import Resolver
import SwiftHelpers

protocol RepositoryListPresenterProtocol: AnyObject {
	func didFetchNextRepositories()
	func didFailFetchNextRepositories(_ error: NetworkError)
}

class RepositoryListPresenter {
	weak var delegate: RepositoryListPresenterProtocol?
	var searchText: String?
	@Injected var gitHubRepository: GitHubRepository
	
	func fetchNextRepositories() {
		guard let searchText = searchText else { return }
		gitHubRepository.fetchNextRepositoriesIfNeeded(searchText: searchText) { [weak self] result in
			switch result {
			case .success(_):
				self?.delegate?.didFetchNextRepositories()
			case .failure(let error):
				self?.delegate?.didFailFetchNextRepositories(error)
			}
		}
	}
	
	func hasMorePage() -> Bool {
		return gitHubRepository.hasMorePage()
	}

	func countOfGitHubRepositories() -> Int {
		gitHubRepository.countOfGitHubRepositories()
	}

	func gitHubRepository(at index: Int) -> GitHubRepositoryModel? {
		gitHubRepository.gitHubRepository(at: index)
	}
}
