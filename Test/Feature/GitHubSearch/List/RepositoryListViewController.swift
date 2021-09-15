//
//  RepositoryListViewController.swift
//  Test
//
//  Created by Alexa Márk on 2021. 09. 15..
//

import Foundation
import Resolver
import SwiftHelpers
import UIKit

class RepositoryListViewController: BViewController {
	@Injected var presenter: RepositoryListPresenter
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.registerCell(RepositoryListCell.reusableIdentifier)
		loadingState(true)
		presenter.fetchNextRepositories()
	}
	
	override func didScrollToNextPage() {
		super.didScrollToNextPage()
		presenter.fetchNextRepositories()
	}
}

extension RepositoryListViewController: RepositoryListPresenterProtocol {
	func didFetchNextRepositories() {
		loadingState(false)
		tableView.reloadData()
		showTableViewBottomActivityIndicator(presenter.hasMorePage())
	}
	
	func didFailFetchNextRepositories(_ error: NetworkError) {
		loadingState(false)
		showTableViewBottomActivityIndicator(false)
		showToast(message: error.localizedDescription)
	}
}

extension RepositoryListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		guard let gitHubRepository = presenter.gitHubRepository(at: indexPath.row) else { return }
		let detailVC = Resolver.main.resolve(RepositoryDetailViewController.self)
		detailVC.presenter.gitHubRepository = gitHubRepository
		self.navigationController?.pushViewController(detailVC, animated: true)
	}
}

extension RepositoryListViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		presenter.countOfGitHubRepositories()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let gitHubRepository = presenter.gitHubRepository(at: indexPath.row),
			  let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryListCell.reusableIdentifier, for: indexPath) as? RepositoryListCell
		else { return UITableViewCell() }
		cell.config(gitHubRepository: gitHubRepository, indexPathRow: indexPath.row)
		return cell
	}
}
