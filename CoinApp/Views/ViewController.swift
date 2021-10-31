//
//  ViewController.swift
//  CoinCapApiCall
//
//  Created by Nikita Shvad on 31.10.2021.
//

import UIKit
import SnapKit
import Moya
class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .blue
        table.dataSource = self
        table.estimatedRowHeight = 100
        table.register(CoinCell.self, forCellReuseIdentifier: "\(CoinCell.self)")
        return table
    }()
    
    private var coinInfo: [CoinInfo] = []
    private let coinProvider = MoyaProvider<OpenCmcRoute>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchCoinInfo()
    }
    
    func setupView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CoinCell.self)") as? CoinCell
        let coinInformation = coinInfo[indexPath.row]
        cell?.configure(coinInfo: coinInformation)
       guard let safeCell = cell else { fatalError("Can not deque the cell")}
        return safeCell
    }
}
//MARK: - Fetch Coin Info Function
extension ViewController {
    func fetchCoinInfo() {
        coinProvider.request(.latest) { [weak self] result in
            switch result {
            case let .success(response):
                do {
                    let coinResponse = try response.map(CoinResponse.self)
                    self?.coinInfo = coinResponse.data
                    self?.tableView.reloadData()
                }
                catch {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
