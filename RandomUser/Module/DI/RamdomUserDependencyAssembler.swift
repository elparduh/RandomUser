//
//  RamdomUserDependencyAssembler.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 09/10/22.
//

import Foundation

protocol RamdomUserDependencyAssembler {
  func resolve(userGeneratorViewProtocol: UserGeneratorViewProtocol) -> UserGeneratorPresenterProtocol
  func resolve() -> RamdomUserProviderProtocol
  func resolve() -> RamdomUserRepositoryProtocol
  func resolve() -> RamdomUserAPIDataSourceProtocol
  func resolve() -> NetworkingProtocol
}

extension RamdomUserDependencyAssembler {
  func resolve(userGeneratorViewProtocol: UserGeneratorViewProtocol) -> UserGeneratorPresenterProtocol {
    return UserGeneratorPresenter(ramdomUserProvider: resolve(), userGeneratorView: userGeneratorViewProtocol)
  }

  func resolve() -> RamdomUserProviderProtocol {
    return RamdomUserProvider(ramdomUserRepository: resolve())
  }

  func resolve() -> RamdomUserRepositoryProtocol {
    return RamdomUserRepository(ramdomUserAPIDataSource: resolve())
  }

  func resolve() -> RamdomUserAPIDataSourceProtocol {
    return RamdomUserAPIDataSource(networking: resolve())
  }

  func resolve() -> NetworkingProtocol {
    return Networking()
  }
}

class RamdomUserAssemblerInjector : RamdomUserDependencyAssembler {

}
