//
//  CoinCell.swift
//  CoinCapApiCall
//
//  Created by Nikita Shvad on 31.10.2021.
//

import UIKit

class CoinCell: UITableViewCell {
   
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView.init(arrangedSubviews: [coinNameLabel,coinPriceLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var coinNameLabel: UILabel = {
        let coinLabel = UILabel()
        coinLabel.textColor = .black
        return coinLabel
    }()
    
    private lazy var coinPriceLabel: UILabel = {
        let price = UILabel()
        price.textColor = .red
        price.font = coinNameLabel.font
        price.textAlignment = .right
        return price
    }()
    
    func setupView() {
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
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
        let coinPrice = String(format: "%.4f", coinInfo.quote["USD"]?.price ?? 0)
        let coinName = coinInfo.name
        
        coinPriceLabel.text = coinPrice
        coinNameLabel.text = coinName
    }
}
