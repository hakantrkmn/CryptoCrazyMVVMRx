//
//  CryptoViewModel.swift
//  CryptoCrazyMVVMRx
//
//  Created by Hakan Türkmen on 19.12.2023.
//

import Foundation
import RxSwift
import RxCocoa


class CryptoViewModel{
    
    let cryptoes : PublishSubject<[Crypto]> = PublishSubject()
    let error : PublishSubject<String> = PublishSubject()
    let loading : PublishSubject<Bool> = PublishSubject()
    
     func requestData() {
        self.loading.onNext(true)
        let url = URL(string: "https://api.coincap.io/v2/assets")!
        
        WebService.downloadCurrencies(url: url) { result in
            self.loading.onNext(false)
            switch result{
            case .success(let cryptolist):
                self.cryptoes.onNext(cryptolist.data!)
            case .failure(let err):
                self.error.onNext(err.localizedDescription)
            }
        }
    }
}
