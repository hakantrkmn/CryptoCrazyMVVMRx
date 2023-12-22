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
    var chart : CandleStickChartView = {
        var chart = CandleStickChartView()
    
        return chart
    }()
    
    var cryptoData : [CryptoCandle] = []
    let disposeBag = DisposeBag()
    
    let cryptoCandleVM = ChartViewModel()
    
    let chartView : UIView = {
        let chart = UIView()
            
        
        return chart
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUpBindings()
        view.backgroundColor = .systemBackground
        title = crypto?.name
    }
    func setupUI()
    {
        view.addSubview(chartView)
        chartView.addSubview(chart)
       
        
        chartView.translatesAutoresizingMaskIntoConstraints=false
        chart.translatesAutoresizingMaskIntoConstraints=false
        
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            chartView.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.size.height/2 ),
            chartView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            chartView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            
            chart.topAnchor.constraint(equalTo: chartView.topAnchor , constant: 10),
            chart.heightAnchor.constraint(equalTo: chartView.heightAnchor ),
            chart.leadingAnchor.constraint(equalTo: chartView.leadingAnchor, constant: 10),
            chart.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -10),
            
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cryptoCandleVM.requestCandleData()

        setData()
    }
  
    
    func setData(){
        
        
        print(cryptoData.count)
        var entries = [CandleChartDataEntry]()
        //read from file
        for x in cryptoData {
            entries.append(CandleChartDataEntry(x: (x.period!) ,
                                                shadowH: Double(x.high!) ?? 0,
                                                shadowL: Double(x.low!) ?? 0,
                                                open: Double(x.open!) ?? 0,
                                                close: Double(x.close!) ?? 0,
                                                icon: nil))
            
        }
        //read for api
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
        
    }
    
}
