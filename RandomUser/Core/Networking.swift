//
//  Networking.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 08/10/22.
//

import Foundation

protocol NetworkingProtocol: AnyObject {
  func get<T>(type: T.Type,url: URL, completion: @escaping (Result<T,NetworkError>) -> Void) where T: Decodable
}

final class Networking: NetworkingProtocol {
  func get<T>(type: T.Type, url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
    URLSession.shared.dataTask(with: url) { data, response, error in
      DispatchQueue.main.async {
        guard let data = data, error == nil else {
          completion(.failure(.serverError))
          return
        }
        do {
          let jsonData = try JSONDecoder().decode(T.self, from: data)
          completion(.success(jsonData))
        } catch {
          completion(.failure(.decodingError))
        }
      }
    }.resume()
  }
}
