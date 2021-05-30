//
//  StockListDisplayManager.swift
//  StockList
//
//  Created by Дмитрий Орлянский on 26.02.2021.
//

import UIKit

class StockListDisplayManager: NSObject {

    var tableView: UITableView!
    var delegate: StockListDisplayManagerDelegate?
    
    var stockArray: [Stock] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupTableView()
    }
    
    func setupTableView() {
        let nib = UINib(nibName: StockListCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StockListCell.identifier)
        tableView.rowHeight = 60
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension StockListDisplayManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stock = stockArray[indexPath.row]
        delegate?.stockListDisplayManager(self, didSelectStock: stock)
    }
}

extension StockListDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StockListCell.identifier) as! StockListCell
        let stock = stockArray[indexPath.row]
        cell.fill(stock)
        return cell
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}


