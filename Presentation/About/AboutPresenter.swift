//
//  AboutPresenter.swift
//  StockList
//
//  Created by Дмитрий Орлянский on 25.02.2021.
//

import Foundation
import PromiseKit

class AboutPresenter: AboutViewOutput {
    weak var view: AboutViewInput!
    var stockService: StockService = StockServiceImp.shared
    
    init(view: AboutViewInput) {
        self.view = view
    }
    
    func viewIsReady() {
        view.setupInitialState()
        view.fillLabels()
    }
    
    func getCompanyLogo(companySymbol: String) {
        view.startLoading()
        firstly {
            stockService.getLogoUrl(symbol: companySymbol)
        } .done { [weak self] (companyLogo) in
            self?.view.loadLogoWith(companyLogo.url)
        } .catch { [weak self] (error) in
            self?.view.show(error)
        }.finally { [weak self] in
            self?.view.stopLoading()
        }
    }    
}
