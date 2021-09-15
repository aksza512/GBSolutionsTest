//
//  RepositoryListCell.swift
//  Test
//
//  Created by Alexa Márk on 2021. 09. 15..
//

import Foundation
import UIKit
import SwiftHelpers

class RepositoryListCell: UITableViewCell {
	static let reusableIdentifier = "RepositoryListCell"
	@IBOutlet weak var titleLabelStackView: UIStackView!
	@IBOutlet weak var valueLabelStackView: UIStackView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var staticDescriptionLabel: UILabel!
	@IBOutlet weak var stargazersLabel: UILabel!
	@IBOutlet weak var updatedAtLabel: UILabel!
	
	func config(gitHubRepository: GitHubRepositoryModel, indexPathRow: Int) {
		refresBackground(for: indexPathRow)
		nameLabel.text = gitHubRepository.name
		descriptionLabel.text = gitHubRepository.description
		titleLabelStackView.setView([staticDescriptionLabel], gone: gitHubRepository.description == nil, animated: false)
		valueLabelStackView.setView([descriptionLabel], gone: gitHubRepository.description == nil, animated: false)
		stargazersLabel.text = "\(gitHubRepository.stargazers_count)"
		updatedAtLabel.text = gitHubRepository.updated_at
	}
		
	func refresBackground(for indexPathRow: Int) {
		if indexPathRow % 2 == 0 {
			contentView.backgroundColor = .groupTableViewBackground
		} else {
			contentView.backgroundColor = .white
		}
	}
}
