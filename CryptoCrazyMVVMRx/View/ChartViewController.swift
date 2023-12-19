//
//  ChartViewController.swift
//  CryptoCrazyMVVMRx
//
//  Created by Hakan Türkmen on 19.12.2023.
//

import UIKit
import DGCharts
class ChartViewController: UIViewController {
   

    var crypto : Crypto?
    var chart = CandleStickChartView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        chart.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height-100)
        chart.center = view.center
        
        view.addSubview(chart)
        
        
        var entries = [CandleChartDataEntry]()
        
        for x in 0..<10 {
            entries.append(CandleChartDataEntry(x: Double(x), shadowH: Double(x*2), shadowL: Double(x/2), open: Double(x/4), close: Double(x*4)))
        }
        
        let set = CandleChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.material()
        let data = CandleChartData(dataSet: set)
        
        chart.data = data
    }
 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
