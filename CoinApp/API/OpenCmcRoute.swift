//
//  OpenCmcRoute.swift
//  CoinCapApiCall
//
//  Created by Nikita Shvad on 31.10.2021.
//

import Foundation
import Moya

enum OpenCmcRoute {
    case latest
}

extension OpenCmcRoute: TargetType {
    var baseURL: URL {
        URL(string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings")!
    }
    
    var path: String {
        switch self {
        case .latest:
            return "latest"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .latest:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .latest:
            let parameters: [String: Any] = [
                "start" : "1",
                "limit" : "500",
                "convert" : "USD"
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .latest:
            let headers: [String : String] = [
                "X-CMC_PRO_API_KEY": "3eec2ab0-3d6b-4cb2-b679-94776e1bf9fb"
            ]
            return headers
        }
    }
    
    
}
