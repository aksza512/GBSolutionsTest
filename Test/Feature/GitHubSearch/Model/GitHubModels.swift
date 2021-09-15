//
//  GitHubRepository.swift
//  Test
//
//  Created by Alexa Márk on 2021. 09. 15..
//

import Foundation

struct GitHubRepositories: Codable {
	let total_count: Int
	let items: [GitHubRepositoryModel]
}

struct GitHubRepositoryModel: Codable {
	let name: String
	var description: String?
	let stargazers_count: Int
	let updated_at: String
	let created_at: String
	let forks_count: Int
	let html_url: String
	let owner: GitHubOwner
}

struct GitHubOwner: Codable {
	let login: String
	let avatar_url: String
	let html_url: String
}
