//
//  Crypto.swift
//  CryptoCrazyMVVMRx
//
//  Created by Hakan Türkmen on 18.12.2023.
//

import Foundation


struct Cryptoes : Codable {
    let data : [Crypto]?
    let timestamp : Int?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case timestamp = "timestamp"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([Crypto].self, forKey: .data)
        timestamp = try values.decodeIfPresent(Int.self, forKey: .timestamp)
    }

}


struct Crypto : Codable{
    

      var id                : String? = nil
      var rank              : String? = nil
      var symbol            : String? = nil
      var name              : String? = nil
      var supply            : String? = nil
      var maxSupply         : String? = nil
      var marketCapUsd      : String? = nil
      var volumeUsd24Hr     : String? = nil
      var priceUsd          : String? = nil
      var changePercent24Hr : String? = nil
      var vwap24Hr          : String? = nil
      var explorer          : String? = nil

      enum CodingKeys: String, CodingKey {

        case id                = "id"
        case rank              = "rank"
        case symbol            = "symbol"
        case name              = "name"
        case supply            = "supply"
        case maxSupply         = "maxSupply"
        case marketCapUsd      = "marketCapUsd"
        case volumeUsd24Hr     = "volumeUsd24Hr"
        case priceUsd          = "priceUsd"
        case changePercent24Hr = "changePercent24Hr"
        case vwap24Hr          = "vwap24Hr"
        case explorer          = "explorer"
      
      }

      init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id                = try values.decodeIfPresent(String.self , forKey: .id                )
        rank              = try values.decodeIfPresent(String.self , forKey: .rank              )
        symbol            = try values.decodeIfPresent(String.self , forKey: .symbol            )
        name              = try values.decodeIfPresent(String.self , forKey: .name              )
        supply            = try values.decodeIfPresent(String.self , forKey: .supply            )
        maxSupply         = try values.decodeIfPresent(String.self , forKey: .maxSupply         )
        marketCapUsd      = try values.decodeIfPresent(String.self , forKey: .marketCapUsd      )
        volumeUsd24Hr     = try values.decodeIfPresent(String.self , forKey: .volumeUsd24Hr     )
        priceUsd          = try values.decodeIfPresent(String.self , forKey: .priceUsd          )
        changePercent24Hr = try values.decodeIfPresent(String.self , forKey: .changePercent24Hr )
        vwap24Hr          = try values.decodeIfPresent(String.self , forKey: .vwap24Hr          )
        explorer          = try values.decodeIfPresent(String.self , forKey: .explorer          )
     
      }

      init() {

      }



}
