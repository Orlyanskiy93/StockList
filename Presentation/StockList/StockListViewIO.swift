//
//  StockListViewIO.swift
//  StockList
//
//  Created by Дмитрий Орлянский on 25.02.2021.
//

import Foundation

protocol StockListViewInput: class, UIViewInput {
    func setupInitialState()
    func update(_ stocks: [Stock])
    func startLoading()
    func stopLoading()
}

protocol StockListViewOutput {
    func viewIsReady()
    func load(_ type: StockType)
    func didSelectSegment(_ index: Int)
}
