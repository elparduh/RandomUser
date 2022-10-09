//
//  RamdomUserRepository.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 08/10/22.
//

import Foundation

protocol RamdomUserRepositoryProtocol {
  func getRamdomUser(completion: @escaping (Result<RamdomUserModel,NetworkError>) -> Void)
}

class RamdomUserRepository: RamdomUserRepositoryProtocol {
  private var ramdomUserAPIDataSource : RamdomUserAPIDataSourceProtocol

  init(ramdomUserAPIDataSource : RamdomUserAPIDataSourceProtocol){
    self.ramdomUserAPIDataSource = ramdomUserAPIDataSource
  }
  
  func getRamdomUser(completion: @escaping (Result<RamdomUserModel, NetworkError>) -> Void) {
    self.ramdomUserAPIDataSource.getRamdomUser { resultData in
      completion(resultData)
    }
  }
}
