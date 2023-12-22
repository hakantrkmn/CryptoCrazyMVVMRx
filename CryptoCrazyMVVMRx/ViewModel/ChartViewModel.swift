//
//  ChartViewModel.swift
//  CryptoCrazyMVVMRx
//
//  Created by Hakan Türkmen on 19.12.2023.
//

import Foundation


import Foundation
import RxSwift
import RxCocoa


class ChartViewModel{
    
    let cryptoCandle : PublishSubject<[CryptoCandle]> = PublishSubject()
    let error : PublishSubject<String> = PublishSubject()
    let loading : PublishSubject<Bool> = PublishSubject()
    
    func requestCandleData(){
        self.loading.onNext(true)
        let url = URL(string: "https://api.coincap.io/v2/candles?exchange=poloniex&interval=h8&baseId=ethereum&quoteId=bitcoin")!
        
        WebService.downloadCandleData(url: url) { result in
            self.loading.onNext(false)
            switch result{
            case .success(let cryptoCandle):
                self.cryptoCandle.onNext(cryptoCandle.data!)
            case .failure(let err):
                self.error.onNext(err.localizedDescription)
            }
        }
        

    }
}
