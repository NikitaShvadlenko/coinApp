//
//  CoinInfo.swift
//  CoinCapApiCall
//
//  Created by Nikita Shvad on 31.10.2021.
//

import Foundation

struct CoinResponse: Decodable {
  let data: [CoinInfo]
}

struct CoinInfo: Decodable {
  let name: String
  let quote: [String: PriceInfo]
}

struct PriceInfo: Decodable {
  let price: Double
}
