//
//  GitHubRepositoryEndPoint.swift
//  Test
//
//  Created by Alexa Márk on 2021. 09. 15..
//

import SwiftHelpers
import UIKit

enum GitHubRepositoryEndPoint {
	case repositories(_ saerchText: String, page: Int, pageSize: Int)
}

extension GitHubRepositoryEndPoint: EndPoint {
	var baseURL: URL { URL(string: "https://api.github.com/")! }

	var path: String {
		switch self {
		case .repositories(_, _, _): return "search/repositories"
		}
	}

	var httpMethod: HTTPMethod {
		switch self {
		case .repositories(_, _, _): return .get
		}
	}

	var requestType: RequestType {
		switch self {
		case .repositories(let searchText, let page, let pageSize): return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: [
			"q": searchText,
			"page": page,
			"page_size": pageSize
		])
		}
	}

	var needLogin: Bool { false }
}
