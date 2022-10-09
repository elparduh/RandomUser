//
//  UserGeneratorPresenter.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 09/10/22.
//

import Foundation
protocol UserGeneratorPresenterProtocol {
  func retrieveUserData()
}

class UserGeneratorPresenter : UserGeneratorPresenterProtocol {
  private var ramdomUserProvider: RamdomUserProviderProtocol
  private var userGeneratorView: UserGeneratorViewProtocol
  
  init(ramdomUserProvider: RamdomUserProviderProtocol, userGeneratorView: UserGeneratorViewProtocol) {
    self.ramdomUserProvider = ramdomUserProvider
    self.userGeneratorView = userGeneratorView
  }
  
  public func retrieveUserData() {
    self.userGeneratorView.showLoader()
    self.ramdomUserProvider.getRamdomUserProvider().execute { [weak self] responseData in
      self?.userGeneratorView.hideLoader()
      switch responseData {
      case .success(let userData):
        self?.userGeneratorView.diplayUserData(userData: userData)
      case .failure(let error):
        self?.userGeneratorView.showError(message: error.localizedDescription)
      }
    }
  }
}
