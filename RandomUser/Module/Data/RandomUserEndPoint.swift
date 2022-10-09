//
//  RandomUserEndPoint.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 08/10/22.
//

import Foundation

extension Endpoint {
  static func getRandomUser() -> Self{
    return Endpoint(path: "/")
  }
}
