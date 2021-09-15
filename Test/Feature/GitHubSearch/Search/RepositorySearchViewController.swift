//
//  RepositorySearchViewController.swift
//  Test
//
//  Created by Alexa Márk on 2021. 09. 15..
//

import Foundation
import Resolver
import SwiftHelpers
import UIKit

class RepositorySearchViewController: BViewController {
	@Injected var presenter: RepositorySearchPresenter
	@IBOutlet weak var searchTextField: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		searchTextField.becomeFirstResponder()
	}
	
	@IBAction func searchButtonPressed(_ sender: Any) {
		let listVC = Resolver.main.resolve(RepositoryListViewController.self)
		listVC.presenter.searchText = searchTextField.text
		self.navigationController?.pushViewController(listVC, animated: true)
	}
}

extension RepositorySearchViewController: RepositorySearchPresenterProtocol {

}
