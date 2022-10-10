//
//  RamdomUserProvider.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 08/10/22.
//

import Foundation
// MARK: - RamdomUserProviderProtocol
protocol RamdomUserProviderProtocol {
  func getRamdomUserProvider() -> RamdomUserUseCase
}
// MARK: - RamdomUserProvider
class RamdomUserProvider: RamdomUserProviderProtocol {
  private var ramdomUserRepository: RamdomUserRepositoryProtocol
  
  init(ramdomUserRepository: RamdomUserRepositoryProtocol) {
    self.ramdomUserRepository = ramdomUserRepository
  }
  
  func getRamdomUserProvider() -> RamdomUserUseCase {
    return RamdomUserUseCase(ramdomUserRepository: self.ramdomUserRepository)
  }
}
