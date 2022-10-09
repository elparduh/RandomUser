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
        let titleAndMessage = self?.titleAndMessageError(for: error)
        self?.userGeneratorView.showError(titleAndMessage?.1 ?? "Please try again.\nTap the button again")
      }
    }
  }

  func titleAndMessageError(for error: NetworkError) -> (String, String) {
      let title: String
      let message: String
      switch error {
      case .serverError:
          title = "Server Error"
          message = "We could not process your request. Please try again.\nTap the button again"
      case .decodingError:
          title = "Network Error"
          message = "Ensure you are connected to the internet. Please try again."
      }
      return (title, message)
  }
}
