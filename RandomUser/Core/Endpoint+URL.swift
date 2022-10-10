//
//  Endpoint+URL.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 08/10/22.
//

import Foundation
// MARK: - extension Endpoint for URLComponents
extension Endpoint {
  var url: URL {
    let constants: Constants = Constants()
    var components = URLComponents()
    components.scheme = constants.schemeURL
    components.host = constants.host
    components.path = constants.basePath + path
    guard let url = components.url else {
      preconditionFailure("Invalid URL components: \(components)")
    }
    return url
  }
}
