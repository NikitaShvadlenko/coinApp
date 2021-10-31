//
//  CoinCell.swift
//  CoinCapApiCall
//
//  Created by Nikita Shvad on 31.10.2021.
//

import UIKit

class CoinCell: UITableViewCell {
   
    private lazy var coinView: UIStackView = {
        let coinView = UIStackView()
        coinView.alignment = .center
        coinView.axis = .horizontal
        return coinView
    }()
    
    private lazy var coinNameLabel: UILabel = {
        let coinLabel = UILabel()
        coinLabel.textColor = .black
        return coinLabel
    }()
    
    private lazy var coinPriceLabel: UILabel = {
        let price = UILabel()
        price.textColor = .red
        price.font.withSize(10.0)
        price.textAlignment = .left
        return price
    }()
    
    func setupView() {
        contentView.addSubview(coinView)
        coinView.addArrangedSubview(coinNameLabel)
        coinView.addArrangedSubview(coinPriceLabel)
        coinView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.top.equalToSuperview()
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - PublicMethod
extension CoinCell {
    func configure(coinInfo: CoinInfo) {
        let coinPrice = String(format: "%.4f", coinInfo.quote["USD"]?.price as! CVarArg)
        let coinName = coinInfo.name
        
        coinPriceLabel.text = coinPrice
        coinNameLabel.text = coinName
    }
}
