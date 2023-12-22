//
//  ViewController.swift
//  CryptoCrazyMVVMRx
//
//  Created by Hakan Türkmen on 18.12.2023.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CurrencyTableCVCell.self, forCellWithReuseIdentifier: CurrencyTableCVCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        return collectionView
        
    }()
    
    
    
    
    var cryptoes : [Crypto] = []
    let disposeBag = DisposeBag()
    
    let cryptoVM = CryptoViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        setUpBindings()
        cryptoVM.requestData()
        
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
    
    
    
    public func setupUI(){
        self.navigationItem.title = "Currencies"
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints=false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setUpBindings(){
        
        
        cryptoVM.error.observe(on: MainScheduler.asyncInstance).subscribe{ error in
            print(error)
        }.disposed(by: disposeBag)
        
        cryptoVM.cryptoes.observe(on: MainScheduler.asyncInstance).subscribe{ cryptoes in
            self.cryptoes = cryptoes
            self.collectionView.reloadData()
        }.disposed(by: disposeBag)
    }
    
    
}


extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cryptoes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrencyTableCVCell.identifier, for: indexPath) as? CurrencyTableCVCell else {return UICollectionViewCell()}
        cell.configure(with: cryptoes[indexPath.row], loading: cryptoVM.loading)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ChartViewController()
        vc.crypto = cryptoes[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.bounds.width/3 - (12/3)
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}

