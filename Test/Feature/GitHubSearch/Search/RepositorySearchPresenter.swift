//
//  RepositorySearchPresenter.swift
//  Test
//
//  Created by Alexa Márk on 2021. 09. 15..
//

import Foundation
import Resolver

protocol RepositorySearchPresenterProtocol: AnyObject {
}

class RepositorySearchPresenter {
	weak var delegate: RepositorySearchPresenterProtocol?
}
