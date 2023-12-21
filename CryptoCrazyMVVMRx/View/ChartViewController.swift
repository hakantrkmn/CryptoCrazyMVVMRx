//
//  ChartViewController.swift
//  CryptoCrazyMVVMRx
//
//  Created by Hakan Türkmen on 19.12.2023.
//

import UIKit
import DGCharts
import RxSwift
import RxCocoa


class ChartViewController: UIViewController {
   

    var crypto : Crypto?
    var chart = CandleStickChartView()
    
    var cryptoData : [CryptoCandle] = []
    let disposeBag = DisposeBag()
    
    let cryptoCandleVM = ChartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = crypto?.name
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cryptoCandleVM.requestCandleData()
        setUpBindings()
        let guide = view.safeAreaLayoutGuide
        let height = guide.layoutFrame.size.height-100
        
        let chartView = UIView(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: height  ))
        chart.frame = CGRect(x: 0, y: 0, width: chartView.frame.width, height: chartView.frame.height)
        view.addSubview(chartView)
        chartView.addSubview(chart)
        
        
        var entries = [CandleChartDataEntry]()
        
        for x in cryptoData {
            entries.append(CandleChartDataEntry(x: Double(x.period!) ?? 0 ,
                                                shadowH: Double(x.high!) ?? 0,
                                                shadowL: Double(x.low!) ?? 0,
                                                open: Double(x.open!) ?? 0,
                                                close: Double(x.close!) ?? 0,
                                                icon: nil))

        }
//        for x in cryptoData {
//            entries.append(CandleChartDataEntry(x: Double(from: x.period ?? 0 ),
//                                                shadowH: Double(from: x.high ?? 0),
//                                                shadowL: Double(from: x.low ?? 0 ),
//                                                open: Double(from: x.open ?? 0 ),
//                                                close: Double(from: x.close ?? 0 )))
//        }
        
        let set = CandleChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.material()
        let data = CandleChartData(dataSet: set)
        
        chart.data = data
    }
 
    

    private func setUpBindings(){
        
    
        
        cryptoCandleVM.cryptoCandle.subscribe{ data in
            self.cryptoData = data
        }.disposed(by: disposeBag)
        
//        cryptoVM.cryptoes.observe(on: MainScheduler.asyncInstance).subscribe{ cryptoes in
//            self.cryptoes = cryptoes
//            self.tableView.reloadData()
//        }.disposed(by: disposeBag)
//
    }

}
