//
//  UserGeneratorPresenter.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 09/10/22.
//

import Foundation
// MARK: - UserGeneratorPresenterProtocol
protocol UserGeneratorPresenterProtocol {
  func retrieveUserData()
}
// MARK: - UserGeneratorPresenter
class UserGeneratorPresenter : UserGeneratorPresenterProtocol {
  // MARK: - Properties
  private var ramdomUserProvider: RamdomUserProviderProtocol
  private var userGeneratorView: UserGeneratorViewProtocol
  let constants: Constants = Constants()
  // MARK: - Constructor
  init(ramdomUserProvider: RamdomUserProviderProtocol, userGeneratorView: UserGeneratorViewProtocol) {
    self.ramdomUserProvider = ramdomUserProvider
    self.userGeneratorView = userGeneratorView
  }
  // MARK: - retrieveUserData
  public func retrieveUserData() {
    self.userGeneratorView.showLoader()
    self.ramdomUserProvider.getRamdomUserProvider().execute { [weak self] responseData in
      self?.userGeneratorView.hideLoader()
      switch responseData {
      case .success(let userData):
        self?.userGeneratorView.diplayUserData(userData: userData)
      case .failure(let error):
        let titleAndMessage = self?.titleAndMessageError(for: error)
        self?.userGeneratorView.showError(titleAndMessage?.1 ?? "")
      }
    }
  }
  // MARK: - titleAndMessageError
  func titleAndMessageError(for error: NetworkError) -> (String, String) {
      let title: String
      let message: String
      switch error {
      case .serverError:
        title = constants.titleServerError
        message = constants.messageServerError
      case .decodingError:
        title = constants.titleNetworkError
        message = constants.messageNetworkError
      }
      return (title, message)
  }
}
