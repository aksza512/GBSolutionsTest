//
//  RepositoryDetail.swift
//  Test
//
//  Created by Alexa Márk on 2021. 09. 15..
//

import Foundation
import Resolver
import SwiftHelpers
import UIKit
import Kingfisher
import SafariServices

class RepositoryDetailViewController: BViewController {
	@Injected var presenter: RepositoryDetailPresenter
	@IBOutlet weak var containerStackView: UIStackView!
	@IBOutlet weak var descriptionStackView: UIStackView!
	@IBOutlet weak var avatarUrlStackView: UIStackView!
	@IBOutlet weak var ownerNameLabel: UILabel!
	@IBOutlet weak var ownerAvatarImageView: UIImageView!
	@IBOutlet weak var ownerGitHubLinkButton: UIButton!
	@IBOutlet weak var repositoryNameLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var stargezersCountLabel: UILabel!
	@IBOutlet weak var forksLabel: UILabel!
	@IBOutlet weak var createdAtLabel: UILabel!
	@IBOutlet weak var updatedAtLabel: UILabel!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		refreshUI()
	}
	
	func refreshUI() {
		ownerNameLabel.text = presenter.gitHubRepository?.owner.login
		if let avatarUrl = presenter.gitHubRepository?.owner.avatar_url {
			ownerAvatarImageView.kf.setImage(with: URL(string: avatarUrl)!)
		} else {
			containerStackView.setView([avatarUrlStackView], gone: true, animated: false)
		}
		ownerGitHubLinkButton.setTitle(presenter.gitHubRepository?.owner.html_url, for: .normal)
		repositoryNameLabel.text = presenter.gitHubRepository?.name
		descriptionLabel.text = presenter.gitHubRepository?.description
		containerStackView.setView([descriptionStackView], gone: presenter.gitHubRepository?.description == nil, animated: false)
		stargezersCountLabel.text = "\(presenter.gitHubRepository?.stargazers_count ?? 0)"
		forksLabel.text = "\(presenter.gitHubRepository?.forks_count ?? 0)"
		createdAtLabel.text = presenter.gitHubRepository?.created_at
		updatedAtLabel.text = presenter.gitHubRepository?.updated_at
	}
	
	@IBAction func ownerGitHubLinkButtonPressed(_ sender: Any) {
		guard let htmlUrl = presenter.gitHubRepository?.owner.html_url else { return }
		let vc = SFSafariViewController(url: URL(string: htmlUrl)!)
		self.present(vc, animated: true)

	}
}

extension RepositoryDetailViewController: RepositoryDetailPresenterProtocol {

}
