//
//  Storyboard+Injection.swift
//  reapp
//
//  Created by Márk József Alexa on 2020. 09. 21..
//

import Resolver
import UIKit
import Rswift

extension Resolver {
	public static func registerViewControllers() {
		register { RepositoryListPresenter() }
		register(RepositoryListViewController.self) {
			R.storyboard.repositoryList.repositoryListViewController()
		}
		.resolveProperties { (_, vc) in
			vc.presenter.delegate = vc
		}
		
		register { RepositorySearchPresenter() }
		register(RepositorySearchViewController.self) {
			R.storyboard.repositorySearch.repositorySearchViewController()
		}
		.resolveProperties { (_, vc) in
			vc.presenter.delegate = vc
		}
		
		register { RepositoryDetailPresenter() }
		register(RepositoryDetailViewController.self) {
			R.storyboard.repositoryDetail.repositoryDetailViewController()
		}
		.resolveProperties { (_, vc) in
			vc.presenter.delegate = vc
		}
	}
}
