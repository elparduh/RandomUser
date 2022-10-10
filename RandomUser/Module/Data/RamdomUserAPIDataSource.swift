//
//  RamdomUserAPIDataSource.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 08/10/22.
//

import Foundation
// MARK: - RamdomUserAPIDataSourceProtocol
protocol RamdomUserAPIDataSourceProtocol {
  var networking: NetworkingProtocol { get }
  func getRamdomUser(completion: @escaping (Result<RamdomUserModel,NetworkError>) -> Void)
}
// MARK: - RamdomUserAPIDataSource
class RamdomUserAPIDataSource: RamdomUserAPIDataSourceProtocol {
  var networking: NetworkingProtocol

  init(networking: NetworkingProtocol = Networking()) {
    self.networking = networking
  }

  func getRamdomUser(completion: @escaping (Result<RamdomUserModel, NetworkError>) -> Void) {
    networking.get(type: RamdomUserModel.self, url: Endpoint.getRandomUser().url) { resultData in
      completion(resultData)
    }
  }
}
