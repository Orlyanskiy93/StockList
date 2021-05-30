//
//  AboutViewController.swift
//  StockList
//
//  Created by Дмитрий Орлянский on 25.02.2021.
//

import UIKit
import Kingfisher

class AboutViewController: UIViewController, AboutViewInput {    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var highLablel: UILabel!
    
    var output: AboutViewOutput!
    var stock: Stock!

    override func viewDidLoad() {
        super.viewDidLoad()
        output = AboutPresenter(view: self)
        output.viewIsReady()
    }
    
    func setupInitialState() {
        activityIndicator.hidesWhenStopped = true
    }
    
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
    }
    
    func fillLabels() {
        let symbol = stock.symbol
        output.getCompanyLogo(companySymbol: symbol)
        symbolLabel.text = stock.symbol
        companyNameLabel.text = stock.name
        priceLabel.text = stock.price.description + " $"
        if let priceChange = stock.priceChange {
            priceChangeLabel.textColor = priceChange < 0 ? .red : .green
            priceChangeLabel.text = priceChange > 0 ? "+" + priceChange.description + " %" : priceChange.description + " %"
        } else {
            priceChangeLabel.text = "none"
        }
        if let open = stock.open {
            openLabel.text = open.description + " $"
        } else {
            openLabel.text = "none"
        }
        if let low = stock.low {
            lowLabel.text = low.description + " $"
        } else {
            lowLabel.text = "none"
        }
        if let high = stock.high {
            highLablel.text = high.description + "$"
        } else {
            highLablel.text = "none"
        }
    }
    
    func loadLogoWith(_ logoUrl: URL) {
        logoImageView.kf.setImage(with: logoUrl)
    }
}
