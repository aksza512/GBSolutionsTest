//
//  RepositoryDetailPresenter.swift
//  Test
//
//  Created by Alexa Márk on 2021. 09. 15..
//

import Foundation
import Resolver

protocol RepositoryDetailPresenterProtocol: AnyObject {
}

class RepositoryDetailPresenter {
	weak var delegate: RepositoryDetailPresenterProtocol?
	var gitHubRepository: GitHubRepositoryModel?
}

