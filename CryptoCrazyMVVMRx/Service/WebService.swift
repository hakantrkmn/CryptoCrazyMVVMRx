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

//            do{
//                let cryptoList = try JSONDecoder().decode(Cryptoes.self, from: data)
//                completion(.success(cryptoList))
//            }catch{
//                completion(.failure(.ParsingError))
//            }
      }
//            
        
            
            
            
        }.resume()
    }
}
