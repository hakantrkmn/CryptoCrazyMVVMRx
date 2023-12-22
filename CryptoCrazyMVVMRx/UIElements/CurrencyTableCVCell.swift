//
//  CurrencyTableCVCell.swift
//  CryptoCrazyMVVMRx
//
//  Created by Hakan Türkmen on 21.12.2023.
//

import UIKit
import RxSwift
import RxCocoa

class CurrencyTableCVCell: UICollectionViewCell {
    
    
    static let identifier = "CurrencyTableCVCell"
    
    let disposeBag = DisposeBag()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        label.numberOfLines = 1
        
        return label
    }()
    
    var indicatorView : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        return indicator
    }()
    
    
    private let priceLabel : UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        label.numberOfLines = 1
        return label
    }()
    
    
    public func configure(with crypto : Crypto , loading : PublishSubject<Bool>)
    {
        self.nameLabel.text = crypto.name        
        self.priceLabel.text = crypto.priceUsd?.DoubleToDecimal()

        loading.bind(to: indicatorView.rx.isAnimating).disposed(by: disposeBag)

        setupUI()

    }
    
    func setupUI()
    {
        self.backgroundColor = .systemBackground
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 8.0
        self.addSubview(nameLabel)
        self.addSubview(priceLabel)
        self.addSubview(indicatorView)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints=false
        priceLabel.translatesAutoresizingMaskIntoConstraints=false
        indicatorView.translatesAutoresizingMaskIntoConstraints=false

        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: self.frame.height/2),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: self.frame.height/2),
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: self.frame.width),
            indicatorView.heightAnchor.constraint(equalToConstant: self.frame.height),

        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.nameLabel.text = nil
        self.priceLabel.text=nil
    }
}
