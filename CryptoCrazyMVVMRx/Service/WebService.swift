//
//  WebService.swift
//  CryptoCrazyMVVMRx
//
//  Created by Hakan Türkmen on 18.12.2023.
//

import Foundation


enum CryptoErrors : Error{
    case serverError
    case ParsingError
}

class WebService{
    

    static func downloadCurrencies(url : URL , completion: @escaping (Result<Cryptoes,CryptoErrors>) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error
            {
                completion(.failure(.serverError))
            }
        else if let data =  data {
            let cryptoList = try? JSONDecoder().decode(Cryptoes.self, from: data)
            
            if let cryptolist = cryptoList{
                completion(.success(cryptolist))

            }else
            {
                completion(.failure(.ParsingError))

            }

      }
        
        }.resume()
    }
    static func downloadCandleData(url : URL , completion: @escaping (Result<CandleData,CryptoErrors>) -> ()){
        
        
        do {
          
             // creating a path from the main bundle and getting data object from the path
             if let bundlePath = Bundle.main.path(forResource: "candle", ofType: "json"),
             let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                // Decoding the Product type from JSON data using JSONDecoder() class.
            let candleData = try JSONDecoder().decode(CandleData.self, from: jsonData)
                 print(jsonData)

                 completion(.success(candleData))
             }
          } catch {
              print("hata")
              completion(.failure(.ParsingError))
          }
        
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            
//            if let _ = error
//            {
//                completion(.failure(.serverError))
//            }
//        else if let data =  data {
//            let candleData = try? JSONDecoder().decode(CandleData.self, from: data)
//            
//            if let candleData = candleData{
//                completion(.success(candleData))
//
//            }else
//            {
//                completion(.failure(.ParsingError))
//
//            }
//
//      }
//        
//        }.resume()
    }
}
