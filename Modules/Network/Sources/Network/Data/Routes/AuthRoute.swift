//
//  AuthRoute.swift
//
//
//  Created by João Gabriel Dourado Cervo on 13/03/24.
//

import Foundation
import Core

public enum AuthRoute: Router {
    case requestNewToken(oldToken: String)
    case loginUser(data: [String: Any])
    
    public var baseUri: String { NetworkConstants.baseAPIUri }
    
    public var endpoint: String { "auth" }
    
    public var method: RequestMethod { .post }
    
    public var headers: RequestHeader { NetworkConstants.defaultRequestHeaders }
    
    public var queryItems: RequestHeader { [:] }
    
    public var parameters: [String: Any]? {
        switch self {
        case .requestNewToken(let oldToken):
            return [Constants.tokenHeaderField: oldToken]
        case.loginUser(let data):
            return data
        }
    }
}
