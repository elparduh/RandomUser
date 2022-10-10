//
//  UserGeneratorViewProtocol.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 09/10/22.
//
// MARK: - UserGeneratorViewProtocol
protocol UserGeneratorViewProtocol {
  func showError(_ error: String)
  func showLoader()
  func hideLoader()
  func diplayUserData(userData : UserData)
}
