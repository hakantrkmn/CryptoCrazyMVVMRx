//
//  ViewController.swift
//  CryptoCrazyMVVMRx
//
//  Created by Hakan Türkmen on 18.12.2023.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var indicatorView: UIActivityIndicatorView!
    
    
    var cryptoes : Cryptoes? = nil
    let disposeBag = DisposeBag()
    
    let cryptoVM = CryptoViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.delegate = self
        //tableView.dataSource = self
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        setUpBindings()
        cryptoVM.requestData()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    private func setUpBindings(){
        
        cryptoVM.loading.bind(to: self.indicatorView.rx.isAnimating).disposed(by: disposeBag)
        
        cryptoVM.error.observe(on: MainScheduler.asyncInstance).subscribe{ error in
            print(error)
        }.disposed(by: disposeBag)
        
        cryptoVM.cryptoes.observe(on: MainScheduler.asyncInstance).bind(to: tableView.rx.items(cellIdentifier: "CryptoCell", cellType: CryptoTableViewCell.self)){row,item,cell in
            cell.item = item
        }.disposed(by: disposeBag)
        
//        cryptoVM.cryptoes.observe(on: MainScheduler.asyncInstance).subscribe{ cryptoes in
//            self.cryptoes = cryptoes
//            self.tableView.reloadData()
//        }.disposed(by: disposeBag)
//        
    }


}


extension ViewController : UITableViewDelegate{
   
    
    
}

