//
//  StockListCell.swift
//  StockList
//
//  Created by Дмитрий Орлянский on 26.02.2021.
//

import UIKit

class StockListCell: UITableViewCell {
    static let identifier = "StockListCell"
    
    @IBOutlet weak var priceChangeColorIndicatorView: UIView!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        priceChangeColorIndicatorView.layer.cornerRadius = 10
    }
   
    func fill(_ stock: Stock) {
        symbolLabel.text = stock.symbol
        companyNameLabel.text = stock.name
        if let priceChange = stock.priceChange {
            priceChangeColorIndicatorView.backgroundColor = priceChange < 0 ? .red : .green
            priceChangeLabel.text = priceChange > 0 ? "+" + priceChange.description + " %" : priceChange.description + " %"

        } else {
            priceChangeColorIndicatorView.backgroundColor = .clear
            priceChangeLabel.text = "none"
        }
    }
}
