//
//  Endpoint+URL.swift
//  RandomUser
//
//  Created by Juan Ticante Vicente on 08/10/22.
//

import Foundation

extension Endpoint {
  var url: URL {
    var components = URLComponents()
    components.scheme = Constants.SCHEME_URL
    components.host = Constants.HOST
    components.path = Constants.BASE_PATH + path
    guard let url = components.url else {
      preconditionFailure("Invalid URL components: \(components)")
    }
    return url
  }
}
