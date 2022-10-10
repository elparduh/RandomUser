//
//  RamdomUserUseCase.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 08/10/22.
//

import Foundation
// MARK: - RamdomUserUseCaseProtocol
protocol RamdomUserUseCaseProtocol {
  func execute(completion: @escaping (Result<UserData,NetworkError>) -> Void)
}
// MARK: - RamdomUserUseCase
class RamdomUserUseCase: RamdomUserUseCaseProtocol {
  private var ramdomUserRepository: RamdomUserRepositoryProtocol
  
  init(ramdomUserRepository: RamdomUserRepositoryProtocol) {
    self.ramdomUserRepository = ramdomUserRepository
  }
  
  func execute(completion: @escaping (Result<UserData, NetworkError>) -> Void) {
    self.ramdomUserRepository.getRamdomUser { resultData in
      switch resultData {
      case .success(let ramdomUserModel):
        completion(.success(UserData(ramdomUserModel: ramdomUserModel)))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}
