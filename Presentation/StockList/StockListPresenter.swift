//
//  StockListPresenter.swift
//  StockList
//
//  Created by Дмитрий Орлянский on 25.02.2021.
//

import Foundation
import PromiseKit

class StockListPresenter: StockListViewOutput {
    weak var view: StockListViewInput!
    let stockService: StockService = StockServiceImp.shared
    
    init(view: StockListViewInput) {
        self.view = view
    }
    
    func viewIsReady() {
        view.setupInitialState()
        load(.mostActive)
    }
    
    func didSelectSegment(_ index: Int) {
        guard let type = StockType(rawValue: index) else {
            return view.show(StockError.type)
        }
        load(type)
    }

    func load(_ type: StockType) {
        view.startLoading()
        firstly {
            stockService.getList(type)
        }.done { [weak self] (stocks) in
            self?.view.update(stocks)
            self?.view.stopLoading()
        }.catch { [weak self] (error) in
            self?.view.show(error)
        }
    }

}
