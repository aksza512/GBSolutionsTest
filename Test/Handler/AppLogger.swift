//
//  AppLogger.swift
//  Test
//
//  Created by Alexa Márk on 2021. 09. 15..
//

import SwiftHelpers

class AppLogger: LoggerProtocol {
	public func setupLogger() {
	}

	public func debug(_ message: String) {
		print(message)
	}

	public func info(_ message: String) {
		print(message)
	}

	public func warning(_ message: String) {
		print(message)
	}

	public func error(_ message: String) {
		print(message)
	}
}
