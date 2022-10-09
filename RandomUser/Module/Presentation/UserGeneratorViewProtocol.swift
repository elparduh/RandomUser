//
//  UserGeneratorViewProtocol.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 09/10/22.
//

protocol UserGeneratorViewProtocol {
  func showError(message : String)
  func showLoader()
  func hideLoader()
  func diplayUserData(userData : UserData)
}
