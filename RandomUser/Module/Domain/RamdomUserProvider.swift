//
//  RamdomUserProvider.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 08/10/22.
//

import Foundation

protocol RamdomUserProviderProtocol {
  func getRamdomUserProvider() -> RamdomUserUseCase
}

class RamdomUserProvider: RamdomUserProviderProtocol {
  private var ramdomUserRepository: RamdomUserRepositoryProtocol
  
  init(ramdomUserRepository: RamdomUserRepositoryProtocol) {
    self.ramdomUserRepository = ramdomUserRepository
  }
  
  func getRamdomUserProvider() -> RamdomUserUseCase {
    return RamdomUserUseCase(ramdomUserRepository: self.ramdomUserRepository)
  }
}
