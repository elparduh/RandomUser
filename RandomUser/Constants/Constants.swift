//
//  Constants.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 08/10/22.
//
import UIKit

struct Constants {
  // MARK: - Core Constants
  var schemeURL: String { return "https" }
  var host: String { return "randomuser.me" }
  var basePath: String { return "/api" }
  var messageEmpty: String { return "Sorry but no results were found." }
  // MARK: - DataCardView Constants
  var spacing: CGFloat { return 8.0 }
  var cornerRadius: CGFloat { return 5.0 }
  var constraintTop: CGFloat { return 1.0 }
  var constraintLeading: CGFloat { return 1.0 }
  var constraintTrailing: CGFloat { return 1.0 }
  var constraintBottom: CGFloat { return 1.0 }
  var constraintHeight: CGFloat { return 1.0 }
}
